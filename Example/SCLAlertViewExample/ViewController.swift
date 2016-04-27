import UIKit
import AlertyAlert


let kSuccessTitle = "Congratulations"
let kErrorTitle = "Connection error"
let kNoticeTitle = "Notice"
let kWarningTitle = "Warning"
let kInfoTitle = "Info"
let kSubtitle = "You've just displayed this awesome Pop Up View"

let kDefaultAnimationDuration = 2.0

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSuccess(sender: AnyObject) {
        let title = NSLocalizedString("Disable menu preference?", comment: "")
        let message = NSLocalizedString("Making changes to meal selection will disable your menu preference for this week. Would you like to continue?", comment: "")
        let closeButtonTitle = NSLocalizedString("Cancel", comment: "")
        let continueButtonTitle = NSLocalizedString("Continue", comment: "")
        
        
        let alertView = AlertyAlert()
        alertView.addButton(continueButtonTitle, action: {

        })
        
        alertView.showWarning(title, subTitle: message, closeButtonTitle: closeButtonTitle)
        
//		let alert = SCLAlertView()
//		alert.addButton("First Button", target:self, selector:#selector(ViewController.firstButton))
//		alert.addButton("Second Button") {
//			print("Second button tapped")
//		}
//        alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showError(sender: AnyObject) {
		AlertyAlert().showError("Hold On...", subTitle:"You have not saved your Submission yet. Please save the Submission before accessing the Responses list. Blah de blah de blah, blah. Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.", closeButtonTitle:"OK")
//        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showNotice(sender: AnyObject) {
        AlertyAlert().showNotice(kNoticeTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showWarning(sender: AnyObject) {
        AlertyAlert().showWarning(kWarningTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showInfo(sender: AnyObject) {
        AlertyAlert().showInfo(kInfoTitle, subTitle: kSubtitle)
    }

	@IBAction func showEdit(sender: AnyObject) {
		let alert = AlertyAlert()
		let txt = alert.addTextField("Enter your name")
        alert.hideWhenBackgroundViewIsTapped = true
		alert.addButton("Show Name") {
			print("Text value: \(txt.text)")
		}
		alert.showEdit(kInfoTitle, subTitle:kSubtitle)
	}
	
	func firstButton() {
		print("First button tapped")
	}
}
