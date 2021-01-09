//
//  AlertManager.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

final class AlertManager {
    class func displayAlert(_ alertModel: AlertModel, source: UIViewController) {
        let alert = UIAlertController(title: alertModel.title.localized, message: alertModel.description.localized, preferredStyle: .alert)
        let action = UIAlertAction(title: alertModel.cta?.localized, style: .default, handler: nil)
        alert.addAction(action)
        
        source.present(alert, animated: true, completion: nil)
    }
}
