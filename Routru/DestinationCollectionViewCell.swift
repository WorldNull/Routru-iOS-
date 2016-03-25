//
//  DestinationCollectionViewCell.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/23/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class DestinationCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var destinationImageView: UIImageView!
    
    @IBOutlet weak var destinationNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        destinationImageView.clipsToBounds = true
        
    }



}
