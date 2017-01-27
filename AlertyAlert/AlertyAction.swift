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
    let style: AlertyActionStyleType
    let handler: ((AlertyAction) -> Void)?
    
    /// Set it to *false* if you don't want alert to be dismissed after button is pressed
    public var shallDismissAlert = true
    
    public init(title: String?, style: AlertyActionStyleType, handler: ((AlertyAction) -> Void)?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
    
}

public struct AlertyActionStyle {
    public var font: UIFont?
    public var tintColor: UIColor?
}

public enum AlertyActionStyleType {
    case `default`
    case cancel
    case destructive
}
