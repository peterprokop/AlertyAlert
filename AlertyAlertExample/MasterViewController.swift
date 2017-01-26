//
//  MasterViewController.swift
//  AlertyAlertExample
//
//  Created by Peter Prokop on 23/01/2017.
//  Copyright © 2017 Prokop. All rights reserved.
//

import UIKit
import AlertyAlert

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let alert = Alerty.default.alert(withTitle: "Title", message: "Message")
        
        let action1 = AlertyAction(title: "Action1", style: AlertyActionStyle.standart, handler: nil)
        let action2 = AlertyAction(title: "Action2", style: AlertyActionStyle.destructive, handler: nil)
        var action3 = AlertyAction(title: "Action3", style: AlertyActionStyle.close, handler: nil)
        action3.shallDismissAlert = false
        
        alert.addAction(action1)        
        alert.addAction(action2)
        alert.addAction(action3)
        
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("shouldn't be called")
    }
    
}

