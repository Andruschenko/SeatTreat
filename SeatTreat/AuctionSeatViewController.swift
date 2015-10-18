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
    
    var seat: Seat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentBidPriceLabel.text = String(self.seat.price) + " €"
        temperatureLabel.text = String(self.seat.temperature)
        seatNumberLabel.text = self.seat.column + String(self.seat.row) + ", " + self.seat.seatPosition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
