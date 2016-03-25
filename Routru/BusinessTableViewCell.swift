//
//  BusinessTableViewCell.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/24/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
    
    var businessImage: NSURL?
    var businessName: String?
    var businessAddress: String?
    
    
    @IBOutlet weak var businessImageView: UIImageView!
    
    @IBOutlet weak var businessNameLabel: UILabel!
    
    @IBOutlet weak var businessAddressLabel: UILabel!
    
    @IBOutlet weak var exploreSurroundingsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
