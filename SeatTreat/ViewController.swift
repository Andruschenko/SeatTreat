//
//  ViewController.swift
//  SeatTreat
//
//  Created by Andru on 17/10/15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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


}

