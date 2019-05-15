//
//  PRCell.swift
//  Saudi Fisheries
//
//  Created by Sandipan on 13/05/19.
//  Copyright © 2019 SANDIPAN. All rights reserved.
//

import UIKit

class PRCell: UITableViewCell,FloatRatingViewDelegate {
    
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var lbl3: UILabel!
    @IBOutlet var floatingReview: FloatRatingView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
