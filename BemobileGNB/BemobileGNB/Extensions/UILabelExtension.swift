//
//  UILabelExtension.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

extension UILabel {
    @IBInspectable var localizedString: String? {
        get {
            return text
        }
        
        set {
            text = newValue?.localized
        }
    }
}
