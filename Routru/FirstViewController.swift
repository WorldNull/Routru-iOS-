//
//  FirstViewController.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/22/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

let openMenuNotification = "openMenuNotification"

class FirstViewController: UIViewController {
    
    var queryObject = DestinationQuery(location: "", placeType: "")

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    @IBOutlet weak var searchBarView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var destinationData = ["London, England", "Paris, France", "Venice, Italy", "San Francisco, USA", "Toronto, Canada", "Dubai, United Arab Emirates"]



    var menuOpen = false
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        
        // dynamically resize UICollection cells
        let width = (CGRectGetWidth(collectionView.frame) - CGFloat(24))/CGFloat(1.7)
        flowLayout.itemSize = CGSizeMake(width, width+CGFloat(73))
    

        var button = UIButton()
        button.setImage(UIImage(named: "OpenMenuButtonIcon"), forState: .Normal)
        button.frame = CGRectMake(0, 0, 30, 30)
        button.addTarget(self, action: Selector("MenuButtonTapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        var btnItem:UIBarButtonItem = UIBarButtonItem()
        btnItem.customView = button
        self.navigationItem.leftBarButtonItem = btnItem
        
        appDelegate.drawerContainer?.setDrawerVisualStateBlock(MMDrawerVisualState.swingingDoorVisualStateBlock())
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        automaticallyAdjustsScrollViewInsets = false
        definesPresentationContext = true
        searchBar.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: .Default)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        searchBarView.backgroundColor = UIColor(patternImage: UIImage(named: "NavBarBackground")!)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func MenuButtonTapped(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.drawerContainer?.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        
        flipMenuButtonIcon()
        
    }
    
    @objc func flipMenuButtonIcon() {
        let menuButton = self.navigationItem.leftBarButtonItem?.customView as! UIButton
        
        if menuOpen == false {
            UIView.transitionWithView(menuButton, duration: 0.5,
                options: UIViewAnimationOptions.TransitionFlipFromLeft,
                animations: {
                    menuButton.setImage(UIImage(named: "CloseMenuButtonIcon"), forState: .Normal)
                }, completion: {_ in
                    self.menuOpen = true
            })
            
        } else {
            UIView.transitionWithView(menuButton, duration: 0.5,
                options: UIViewAnimationOptions.TransitionFlipFromRight,
                animations: {
                    menuButton.setImage(UIImage(named: "OpenMenuButtonIcon"), forState: .Normal)
                }, completion: {_ in
                    self.menuOpen = false
            })
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller
        if segue.identifier == "ToDestinationDetailFromSearch" {
            let destinationDetailViewController = segue.destinationViewController as! DestinationDetailViewController
            destinationDetailViewController.queryObject = queryObject
        }
        
        if segue.identifier == "ToDestinationDetailFromCell" {
            let cell = sender as! DestinationCollectionViewCell
            let destinationDetailViewController = segue.destinationViewController as! DestinationDetailViewController
            destinationDetailViewController.generalInfoImage = cell.destinationImageView.image
            let locationNameArray = cell.destinationNameLabel.text!.componentsSeparatedByString(",")
            let cityName = locationNameArray[0]
            destinationDetailViewController.generalInfoTitle = "Wonders of " + cityName
            queryObject.location = cell.destinationNameLabel.text
            destinationDetailViewController.queryObject = queryObject
            
        }
        
    }

    
    
}


extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return destinationData.count
    
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DestinationCollectionViewCell", forIndexPath: indexPath) as! DestinationCollectionViewCell
        
        cell.destinationImageView.image = UIImage(named: destinationData[indexPath.row])
        cell.destinationNameLabel.text = destinationData[indexPath.row]
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        
        return cell
    }
}


extension FirstViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        queryObject.location = searchBar.text
        performSegueWithIdentifier("ToDestinationDetailFromSearch", sender: nil)
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = "Where would you love to travel?"
        searchBar.resignFirstResponder()
    }

    
}



