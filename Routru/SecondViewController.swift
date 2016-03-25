//
//  SecondViewController.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/22/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var navBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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


}

