//
//  AlertyAction.swift
//  AlertyAlertExample
//
//  Created by Peter Prokop on 25/01/2017.
//  Copyright © 2017 Prokop. All rights reserved.
//

import Foundation

public struct AlertyAction {
    
    let title: String?
    let style: AlertyActionStyle
    let handler: ((AlertyAction) -> Void)?
    
    /// Set it to *false* if you don't want alert to be dismissed after button is pressed
    public var shallDismissAlert = true
    
    public init(title: String?, style: AlertyActionStyle, handler: ((AlertyAction) -> Void)?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
    
}

public struct AlertyActionStyle {
    public var font: UIFont?
    public var tintColor: UIColor?
}

public extension AlertyActionStyle {
    
    public static var standart: AlertyActionStyle {
        let font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        return AlertyActionStyle(font: font, tintColor: nil)
    }
    
    public static var close: AlertyActionStyle {
        let font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        return AlertyActionStyle(font: font, tintColor: nil)
    }
    
    public static var destructive: AlertyActionStyle {
        let font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        let color = UIColor(red: 1, green: 0.23, blue: 0.12, alpha: 1)
        return AlertyActionStyle(font: font, tintColor: color)
    }
    
}
