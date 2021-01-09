//
//  ProductSelectionTableViewCell.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import UIKit

struct ProductSelectionTableViewCellModel {
    var productName: String
}

class ProductSelectionTableViewCell: UITableViewCell {
    @IBOutlet private weak var productLabel: UILabel!
    
    var model: ProductSelectionTableViewCellModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ model: ProductSelectionTableViewCellModel) {
        self.model = model
        productLabel.text = model.productName
    }
}
