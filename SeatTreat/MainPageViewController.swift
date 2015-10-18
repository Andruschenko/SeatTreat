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
    
    var seat: Seat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotIcon.setFAIcon(FAType.FAGithub, iconSize: 35)
        
        let baseURL = NSURL(string: "http://172.16.105.236:5000/")
        
        // get the current phase of the flight
        let url = NSURL(string: "Phase", relativeToURL: baseURL)
        
        /* As soon as dynamic Airbus API data is available, uncomment the following two lines. */
        //let networkOperation = NetworkOperation(url: url!)
        //networkOperation.downloadJSONFromURL()
        
        let seatImageArray = [seatImage0, seatImage1, seatImage2];
        var i = 0
        
        BackendAPI.loadAvailableSeats { seatArray in
            for seat in seatArray {
                seatImageArray[i].priceLabel.text = String(seat.price) + " €"
                i++
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAuctionDetail(sender: AnyObject) {
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("auctionSeatViewController") as! AuctionSeatViewController
        
        
        self.presentViewController(vc, animated: true, completion: nil)
        */
        BackendAPI.getSeat("1A") { seat in
            self.seat = seat
            self.performSegueWithIdentifier("showAuctionDetailSegue", sender: sender)
        }
    }
    
    @IBAction func showAuctionDetail1(sender: AnyObject) {
        BackendAPI.getSeat("12C") { seat in
            self.seat = seat
            self.performSegueWithIdentifier("showAuctionDetailSegue", sender: sender)
        }
    }
    
    @IBAction func showAuctionDetail2(sender: AnyObject) {
        BackendAPI.getSeat("27D") { seat in
            self.seat = seat
            self.performSegueWithIdentifier("showAuctionDetailSegue", sender: sender)
        }
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Create a variable that you want to send
        
        if segue.identifier == "showAuctionDetailSegue" {
            let destinationViewController = segue.destinationViewController as! AuctionSeatViewController
            destinationViewController.seat = self.seat
        }
        
    }
}

