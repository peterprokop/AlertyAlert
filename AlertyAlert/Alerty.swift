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
    
    open var titleFont = UIColor.lightGray
    open var messageFont = UIColor.lightGray
    
    open var defaultActionStyle: AlertyActionStyle {
        let font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        return AlertyActionStyle(font: font, tintColor: nil)
    }
    
    open var cancelActionStyle: AlertyActionStyle {
        let font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        return AlertyActionStyle(font: font, tintColor: nil)
    }
    
    open var destructiveActionStyle: AlertyActionStyle {
        let font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        let color = UIColor(red: 1, green: 0.23, blue: 0.12, alpha: 1)
        return AlertyActionStyle(font: font, tintColor: color)
    }
    
}
