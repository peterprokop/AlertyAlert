//
//  Alerty.swift
//  AlertyAlertExample
//
//  Created by Peter Prokop on 23/01/2017.
//  Copyright © 2017 Prokop. All rights reserved.
//

import Foundation

class Alerty {
    
    var cornerRadius = CGFloat(15)
    
    open func alert() -> AlertyAlertController {
        let storyboard = UIStoryboard(name: "AlertyAlert", bundle: nil)
        
        let alertyAlertController = storyboard.instantiateViewController(withIdentifier: "AlertyAlertController") as! AlertyAlertController
        
        return alertyAlertController
    }
    
}
