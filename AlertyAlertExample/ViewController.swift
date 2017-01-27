//
//  MasterViewController.swift
//  AlertyAlertExample
//
//  Created by Peter Prokop on 23/01/2017.
//  Copyright © 2017 Prokop. All rights reserved.
//

import UIKit
import AlertyAlert

class ViewController: UITableViewController {
    
    var items = [ExampleListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultAlertItem = ExampleListItem(title: "Boring default alert") {
            let alert = Alerty.default.alert(withTitle: "Title", message: "Message")
            
            // You can use different action styles just like with regular *UIAlertController*
            let action1 = AlertyAction(title: "Default style action", style: .default, handler: {
                _ in
                print("action1")
            })
            let action2 = AlertyAction(title: "Destructive style action", style: .destructive, handler: {
                _ in
                print("action2")
            })
            let action3 = AlertyAction(title: "Cancel style action", style: .cancel, handler: {
                _ in
                print("action3")
            })
            
            // If *shallDismissAlert* set to *false*, alert will not be dismissed
            var action4 = AlertyAction(title: "This one doesn't dismiss alert", style: .default, handler: {
                _ in
                print("action4")
            })
            action4.shallDismissAlert = false
            
            alert.addAction(action1)
            alert.addAction(action2)
            alert.addAction(action3)
            alert.addAction(action4)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        let alertWithHeaderItem = ExampleListItem(title: "Alert with header") {
            // Create custom style and tweak it a bit
            let style = AlertyStyle()
            style.cornerRadius = 10
            style.titleFont = UIFont(name: "MocharyPERSONALUSEONLY", size: 32)
            style.messageFont = UIFont(name: "MocharyPERSONALUSEONLY", size: 24)
            
            // Init new *Alerty* with our style
            let alerty = Alerty(style: style)
            
            // Load alert header from *.xib*
            let header = Bundle.main.loadNibNamed("SampleAlertHeader", owner: nil, options: nil)![0] as! UIView
            
            let title = "Avertissement du lieutenant politiquement correct"
            let message = "Votre message pourrait être offensive pour les autochtones de la région de Yamal.\nVeuillez corriger votre message."
            
            // Use our custom *alerty* instead of *Alerty.default*
            let alert = alerty.alert(withTitle: title, message: message)
            let closeAction = AlertyAction(title: "I don't understand French!", style: .cancel, handler: nil)
            
            alert.addAction(closeAction)
            alert.addHeader(header)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        items = [
            defaultAlertItem,
            alertWithHeaderItem
        ]
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        item.block()
    }
    
}

struct ExampleListItem {
    let title: String
    let block: () -> Void
}
