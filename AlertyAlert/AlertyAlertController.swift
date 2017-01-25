open class AlertyAlertController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet var titleLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet var buttonStackViewHeightConstraint: NSLayoutConstraint!
    
    open var message: String?
    
    private var actions = [AlertyAction]()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
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
            if let font = action.style.font {
                button.titleLabel?.font = font
            }
            if let color = action.style.tintColor {
                button.setTitleColor(color, for: .normal)
            }
            
            buttonStackView.addArrangedSubview(button)
            
            buttonIndex += 1
        }
        
        buttonStackViewHeightConstraint.constant = CGFloat(actions.count * 40)
    }
    
    open func addAction(_ action: AlertyAction) {
        actions.append(action)
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
