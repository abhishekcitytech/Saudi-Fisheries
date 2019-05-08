//
//  ORCell.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 02/05/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class ORCell: UITableViewCell {

    @IBOutlet var imgvProduct: UIImageView!
    @IBOutlet var lblname: UILabel!
    
    @IBOutlet var lblQuantity: UILabel!
    @IBOutlet var lblUnitPrice: UILabel!
    @IBOutlet var lblSubTotal: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
