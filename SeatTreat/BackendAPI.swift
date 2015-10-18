//
//  BackendAPI.swift
//  SeatTreat
//
//  Created by Jan Erik Herrmann on 17.10.15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import Foundation
import Alamofire

class BackendAPI {

class func loadAvailableSeats() {
    print("run loadAVailableSeats")
    Alamofire.request(.GET, "http://seattreat.eu-gb.mybluemix.net/availableSeats")
        .responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
        }
    }
}
