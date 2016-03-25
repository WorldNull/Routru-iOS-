//
//  Business.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/24/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class Business: NSObject {
    let name: String?
    let location: String?
    let imageUrl: NSURL?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        location = dictionary["address"] as? String
        let imageUrlArray = dictionary["imagesURLs"] as? NSArray
        if imageUrlArray?.count >= 1 {
            let imageUrlString = imageUrlArray![0] as? String
            imageUrl = NSURL(string: imageUrlString!)
        } else {
            imageUrl = nil
        }
    }
    
    class func businesses(array array: [NSDictionary]) -> [Business] {
        var businesses = [Business]()
        for dictionary in array {
            let business = Business(dictionary: dictionary)
            businesses.append(business)
        }
        return businesses
    }

}
