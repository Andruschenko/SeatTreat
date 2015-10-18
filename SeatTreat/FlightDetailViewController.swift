//
//  FlightDetailViewController.swift
//  SeatTreat
//
//  Created by Andru on 18/10/15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class FlightDetailViewController: UIViewController {

    @IBOutlet weak var planeIcon: UILabel!
    @IBOutlet weak var flightInformationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        planeIcon.setFAIcon(FAType.FAPlane, iconSize: planeIcon.font.pointSize)
        
        flightInformationView.layer.borderWidth = 0.5
        flightInformationView.layer.borderColor = UIColor(red: 102/255.0, green: 134/255.0, blue: 183/255.0, alpha: 1.0).CGColor
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
