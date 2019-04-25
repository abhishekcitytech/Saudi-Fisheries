//
//  OHCell.swift
//  Aswaaq Supermarket
//
//  Created by Sandipan on 12/02/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class OHCell: UITableViewCell, FloatRatingViewDelegate {

    @IBOutlet var imgvProduct: UIImageView!
    
    @IBOutlet var lblname: UILabel!
    @IBOutlet var lblCategory: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblQTY: UILabel!

    @IBOutlet var floatingReview: FloatRatingView!

    @IBOutlet var btnStatus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
