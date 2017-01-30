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
    
    public init() {}
    
    public init(style: AlertyStyle) {
        self.style = style
    }
    
}

open class AlertyStyle {
    open var cornerRadius = CGFloat(15)
    
    open var backgroundColor = UIColor.white
    
    open var buttonBorderColor: UIColor? = UIColor.lightGray
    
    open var titleFont: UIFont?
    open var titleColor = UIColor.black
    
    open var messageFont: UIFont?
    open var messageColor = UIColor.black
    
    open var defaultActionStyle = AlertyActionStyle(font: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular), tintColor: nil)
    
    open var cancelActionStyle = AlertyActionStyle(font: UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold), tintColor: nil)

    
    open var destructiveActionStyle = AlertyActionStyle(font: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular), tintColor: UIColor(red: 1, green: 0.23, blue: 0.12, alpha: 1))

    
    public init() {}
}
