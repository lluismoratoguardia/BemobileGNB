//
//  UITableViewCellExtension.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

extension UITableViewCell {
    static func nibName() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: nibName(), bundle: bundle)
    }
}
