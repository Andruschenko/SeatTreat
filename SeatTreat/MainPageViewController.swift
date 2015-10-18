//
//  ViewController.swift
//  SeatTreat
//
//  Created by Andru on 17/10/15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import UIKit
import Font_Awesome_Swift  // change dashes to underscores..

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var hotIcon: UILabel!
    
    @IBOutlet weak var seatImage0: TopSeatView!
    @IBOutlet weak var seatImage1: TopSeatView!
    @IBOutlet weak var seatImage2: TopSeatView!
    @IBOutlet weak var seatImage3: TopSeatView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotIcon.setFAIcon(FAType.FAGithub, iconSize: 35)
        
        let baseURL = NSURL(string: "http://172.16.105.236:5000/")
        
        // get the current phase of the flight
        let url = NSURL(string: "Phase", relativeToURL: baseURL)
        
        let networkOperation = NetworkOperation(url: url!)
        networkOperation.downloadJSONFromURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAuctionDetail(sender: AnyObject) {
        performSegueWithIdentifier("showAuctionDetailSegue", sender: sender)
    }
    
    

}

