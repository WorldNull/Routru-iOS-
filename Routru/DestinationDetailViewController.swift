//
//  DestinationDetailViewController.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/23/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class DestinationDetailViewController: UIViewController {
    
    
    var queryObject: DestinationQuery?
    var generalInfoTitle: String?
    var generalInfoImage: UIImage?
    @IBOutlet weak var generalInfoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var generalInfoImageView: UIImageView!
    @IBOutlet weak var generalInfoTitleLabel: UILabel!
    var navBar: UINavigationBar!
    
    let category = ["Attractions", "Restaurants", "Hotels", "Shopping", "Entertainment", "Outdoor Activities"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        if let generalInfoTitle = generalInfoTitle {
            generalInfoTitleLabel.text = generalInfoTitle
        }
        
        if let generalInfoImage = generalInfoImage {
            generalInfoImageView.image = generalInfoImage
        }
        
        navBar = navigationController?.navigationBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        navBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navBar.shadowImage = UIImage()
        
        navBar.tintColor = UIColor.whiteColor()
        
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = nil
        
        navBar.tintColor = .None
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ToBusinessViewController" {
            let businessViewController = segue.destinationViewController as! BusinessViewController
            let cell = sender as! DestinationDetailTableViewCell
            queryObject!.placeType = cell.categoryNameLabel.text
            businessViewController.queryObject = queryObject!
            
        }
    }


}

extension DestinationDetailViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DestinationDetailTableViewCell") as! DestinationDetailTableViewCell
        
        cell.categoryImageView.image = UIImage(named: category[indexPath.row])
        cell.categoryNameLabel.text = category[indexPath.row]
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        cell.layoutMargins = UIEdgeInsetsZero
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    

}

