open class AlertyAlertController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet var titleLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet var buttonStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var headerContainerViewHeightConstraint: NSLayoutConstraint!
    
    open var message: String?
    open var headerContents: UIView?
    open var style = AlertyStyle()
    
    private var actions = [AlertyAction]()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup appearance
        containerView.backgroundColor = style.backgroundColor
        containerView.layer.cornerRadius = style.cornerRadius
        
        titleLabel.textColor = style.titleColor
        messageLabel.textColor = style.messageColor
        
        if let titleFont = style.titleFont {
            titleLabel.font = titleFont
        }
        if let messageFont = style.messageFont {
            messageLabel.font = messageFont
        }
        
        // Add header
        if let headerContents = headerContents {
            headerContainerViewHeightConstraint.constant = headerContents.frame.height
            
            let offsetX = (headerContainerView.frame.width - headerContents.frame.width)/2
            headerContents.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            
            headerContents.frame = CGRect(x: offsetX, y: 0, width: headerContents.frame.width, height: headerContents.frame.height)
            
            headerContainerView.addSubview(headerContents)
        }
        
        // Setup labels
        titleLabel.text = title
        messageLabel.text = message
        
        if title == nil || title == "" {
            titleLabelTopConstraint.constant = 0
        }
        
        // Layout buttons
        
        var buttonIndex = 0
        for action in actions {
            let button = UIButton(type: .system)
            button.tag = buttonIndex
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            button.setTitle(action.title, for: .normal)
            
            // Set font & color if needed
            let actionStyle: AlertyActionStyle
            
            switch action.style {
            case .default:
                actionStyle = style.defaultActionStyle
            case .destructive:
                actionStyle = style.destructiveActionStyle
            case .cancel:
                actionStyle = style.cancelActionStyle
            }
            
            if let font = actionStyle.font {
                button.titleLabel?.font = font
            }
            if let color = actionStyle.tintColor {
                button.setTitleColor(color, for: .normal)
            }
            
            // Set border
            if let buttonBorderColor = style.buttonBorderColor {
                let borderThickness = 1/UIScreen.main.scale
                let frame = CGRect(x: 0, y: 0, width: button.bounds.width, height: borderThickness)
                let borderView = UIView(frame: frame)
                borderView.backgroundColor = buttonBorderColor
                borderView.autoresizingMask = [.flexibleWidth]
                button.addSubview(borderView)
            }
            
            buttonStackView.addArrangedSubview(button)
            
            buttonIndex += 1
        }
        
        buttonStackViewHeightConstraint.constant = CGFloat(actions.count * 40)
    }
    
    open func addAction(_ action: AlertyAction) {
        actions.append(action)
    }
    
    open func addHeader(_ header: UIView) {
        headerContents = header
    }
    
    // MARK: Actions
    
    func buttonTapped(sender: UIButton) {
        let action = actions[sender.tag]
        
        action.handler?(action)
        
        if action.shallDismissAlert {
            dismiss(animated: true, completion: nil)
        }
    }
    
}
