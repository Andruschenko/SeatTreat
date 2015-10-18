//
//  AuctionSeatViewController.swift
//  SeatTreat
//
//  Created by Andru on 18/10/15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import UIKit

class AuctionSeatViewController: UIViewController {

    @IBOutlet weak var currentBidPriceLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var seatNumberLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var bidAmount: UITextField!
    
    @IBOutlet weak var currentBid: UILabel!
    var seat: Seat!
    
    @IBAction func bidNowAction(sender: AnyObject) {
        
        
        BackendAPI.bidSeat(String(self.seat.row) + self.seat.column, bid: Int(bidAmount.text!)!, user: "Mike") { seat in
            self.seat = seat
            self.currentBid.text = String(seat.price) + " €"
            self.bidAmount.placeholder = String(seat.price + 5)
            self.bidAmount.text = ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentBidPriceLabel.text = String(self.seat.price) + " €"
        temperatureLabel.text = String(self.seat.temperature) + "˚"
        seatNumberLabel.text = self.seat.column + String(self.seat.row) + ", " + self.seat.seatPosition.capitalizedString
        bidAmount.placeholder = String(seat.price + 5)
        
        switch self.seat.row {
        case 1:
            detailsLabel.text = "The best seats offered. Luxurious dinner à la carte included."
        case 12:
            detailsLabel.text = "Comfortable and quiet business seat so that you can focus on what is important."
        case 27:
            detailsLabel.text = "A premium class seat with a bigger screen and tasteful food."
        default:
            detailsLabel.text = "Fulfills all basic needs and provides a pleasant experience"
            
        }
        
        // refresh values every seconds
        var timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    func update() {
        BackendAPI.getSeat(String(self.seat.row) + self.seat.column) { seat in
            self.currentBid.text = String(seat.price) + " €"
            self.bidAmount.placeholder = String(seat.price + 5)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showBiddingResult() {
        if (Int(self.bidAmount.text!) > self.seat.price) {
            currentBid.textColor = UIColor.redColor()
        } else {
            currentBid.textColor = UIColor.greenColor()
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
