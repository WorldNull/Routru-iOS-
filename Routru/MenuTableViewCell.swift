//
//  MenuTableViewCell.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/23/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var menuItemImageView: UIImageView!
    
    @IBOutlet weak var menuItemLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
