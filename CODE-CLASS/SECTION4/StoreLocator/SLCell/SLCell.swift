//
//  SLCell.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 22/02/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class SLCell: UITableViewCell
{
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var btnPhone: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
