//
//  MealTableViewCell.swift
//  First
//
//  Created by David Debre on 12/11/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ratingBar: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
