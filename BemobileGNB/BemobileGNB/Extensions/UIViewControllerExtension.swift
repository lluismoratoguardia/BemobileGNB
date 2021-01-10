//
//  ViewControllerExtension.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

extension UIViewController {
    @IBInspectable var localizedTitle: String? {
        get {
            return title
        }
        
        set {
            title = newValue?.localized
        }
    }
}
