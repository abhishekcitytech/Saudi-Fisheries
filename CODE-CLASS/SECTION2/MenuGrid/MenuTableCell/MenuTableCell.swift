//
//  MenuTableCell.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 13/03/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {

    @IBOutlet var imgvMenu: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imgvETA: UIImageView!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblETA: UILabel!
    @IBOutlet var btnAddMenuCart: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
