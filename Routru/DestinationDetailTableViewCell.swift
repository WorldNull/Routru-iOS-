//
//  DestinationDetailTableViewCell.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/23/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class DestinationDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImageView.layer.cornerRadius = 5
        categoryNameLabel.clipsToBounds = true
        blurEffectView.layer.cornerRadius = 5

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
