//
//  TransactionTableViewCell.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

struct TransactionTableViewCellModel {
    var amount: String
    var currency: String
}

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    
    var model: TransactionTableViewCellModel?
    
    func setup(_ model: TransactionTableViewCellModel) {
        self.model = model
        amountLabel.text = model.amount
        currencyLabel.text = model.currency
    }
}
