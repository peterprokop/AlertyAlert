open class AlertyAlertController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet var titleLabelTopConstraint: NSLayoutConstraint!
    
    open var message: String?
    
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
    }
    
    // MARK: Actions
    
    @IBAction func buttonTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
