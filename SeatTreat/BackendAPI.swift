//
//  BackendAPI.swift
//  SeatTreat
//
//  Created by Jan Erik Herrmann on 17.10.15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BackendAPI {

    class func loadAvailableSeats(completionHandler: (seatArray: [Seat]) -> Void){
    print("run loadAVailableSeats")
    Alamofire.request(.GET, "http://seattreat.eu-gb.mybluemix.net/availableSeats")
        .responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            var seatList = [Seat]()
            
            if let json = response.result.value {
                let jsonObj = JSON(json)
                
                //If json is .Dictionary
                for (key,subJson):(String, JSON) in jsonObj {
                    let seat = Seat(column: subJson["column"].stringValue, row: subJson["row"].intValue, minutesLeft: subJson["minutesLeft"].intValue, secondsLeft: subJson["secondsLeft"].intValue, temperature: subJson["temperature"].intValue, sold: false, seatPosition: subJson["seatPosition"].stringValue, currentBidder: subJson["currentBidder"].stringValue, compartment: subJson["compartment"].stringValue, price: subJson["price"].intValue)

                    seatList.append(seat)

                }
                
            }
            
            completionHandler(seatArray: seatList)
            
        }
    }
    
}
