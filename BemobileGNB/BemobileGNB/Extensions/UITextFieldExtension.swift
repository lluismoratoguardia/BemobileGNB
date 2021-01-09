//
//  UITextFieldExtension.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

extension UITextField {
    @IBInspectable var localizedPlaceholder: String {
        get {
            return self.placeholder ?? ""
        }
        
        set {
            placeholder = newValue.localized
        }
    }
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.paste(_:)) ? false : super.canPerformAction(action, withSender: sender)
    }
}
