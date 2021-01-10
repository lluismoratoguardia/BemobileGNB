//
//  StringExtension.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import Foundation

extension String {
    var localized: String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }
}
