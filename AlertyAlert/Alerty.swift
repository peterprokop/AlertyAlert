//
//  Alerty.swift
//  AlertyAlertExample
//
//  Created by Peter Prokop on 23/01/2017.
//  Copyright © 2017 Prokop. All rights reserved.
//

import Foundation

open class Alerty {
    
    public static var `default` = Alerty()
    
    open var style = AlertyStyle()
    
    open func alert(withTitle title: String?, message: String?) -> AlertyAlertController {
        let bundle = Bundle(for: Alerty.self)
        let storyboard = UIStoryboard(name: "AlertyAlert", bundle: bundle)
        
        let alertyAlertController = storyboard.instantiateViewController(withIdentifier: "AlertyAlertController") as! AlertyAlertController        
        
        alertyAlertController.title = title
        alertyAlertController.message = message
        alertyAlertController.style = style
        
        return alertyAlertController
    }
    
}

open class AlertyStyle {
    open var cornerRadius = CGFloat(15)
    
    open var buttonBorderColor: UIColor? = UIColor.lightGray
}
