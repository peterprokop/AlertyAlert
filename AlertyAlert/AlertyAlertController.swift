class AlertyAlertController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        modalPresentationStyle = .overCurrentContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
