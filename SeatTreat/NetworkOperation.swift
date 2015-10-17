//
//  NetworkOperation.swift
//  SeatTreat
//
//  Created by Andru on 17/10/15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import Foundation
import Alamofire

class NetworkOperation {
    let queryURL: NSURL
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL() {
        Alamofire.request(.GET, queryURL)
            .responseJSON { response in
                
                if (response.result.isSuccess) {
                    if let JSON = response.result.value {
                        self.processJSON(JSON)
                    }
                }
                else {
                    print("Include error handling!")
                }
                
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
        }
    }
    
    func processJSON(JSON: AnyObject) {
        print(JSON)
    }
    
    
}