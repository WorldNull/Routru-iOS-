//
//  BusinessViewController.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/24/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessViewController: UIViewController {
    
    var queryObject = DestinationQuery(location: "", placeType: "")
    var businesses: [Business]?
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        RoutruClient.sharedInstance.fetchBusinesses(queryObject) {(businesses) -> () in
            self.businesses = businesses!
            print(businesses)
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onExplorerTap(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("SurroundingDestinationDetail", sender: sender)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SurroundingDestinationDetail" {
            let gestureRecognizer = sender as! UITapGestureRecognizer
            let exploreButton = gestureRecognizer.view as! UIButton
            let cell = exploreButton.superview?.superview as! BusinessTableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let tweet = businesses![indexPath!.row]
            
            let destinationDetailViewController = segue.destinationViewController as! DestinationDetailViewController
            
            queryObject.location = cell.businessAddressLabel.text
            queryObject.placeType = cell.businessNameLabel.text
            destinationDetailViewController.queryObject = queryObject
            
        }
    }
    
    

}

extension BusinessViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessTableViewCell", forIndexPath: indexPath) as! BusinessTableViewCell
        let business = businesses![indexPath.row]
        if let imageUrl = business.imageUrl {
            cell.businessImageView?.setImageWithURL(business.imageUrl!)
        }
        
        cell.businessAddressLabel.text = business.location
        cell.businessNameLabel.text = business.name
        
        // The onCustomTap: method will be defined in Step 3 below.
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onExplorerTap:")
        
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer.numberOfTapsRequired = 1;
        
        cell.exploreSurroundingsButton.userInteractionEnabled = true
        cell.exploreSurroundingsButton.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let businesses = businesses {
            return businesses.count
        } else {
            return 0
        }
    }
    
}



