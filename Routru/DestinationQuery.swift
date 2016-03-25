//
//  DestinationQuery.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/24/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class DestinationQuery: NSObject {
    var location: String?
    var placeType: String?
    
    init(location: String?, placeType: String?) {
        self.location = location
        self.placeType = placeType
    }
    
}
