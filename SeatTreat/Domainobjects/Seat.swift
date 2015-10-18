//
//  Seat.swift
//  SeatTreat
//
//  Created by Jan Erik Herrmann on 18.10.15.
//  Copyright © 2015 André Kovac. All rights reserved.
//


class Seat {
    
    var column: String
    var row: Int
    var minutesLeft: Int
    var secondsLeft: Int
    var temperature: Int
    var sold: Bool
    var seatPosition: String
    var currentBidder: String
    var compartment: String
    var price: Int
    var description: String = ""
    
    init(column: String, row: Int, minutesLeft: Int, secondsLeft: Int, temperature: Int, sold: Bool, seatPosition: String,
        currentBidder: String, compartment: String, price: Int)
    {
        self.column = column
        self.row = row
        self.minutesLeft = minutesLeft
        self.secondsLeft = secondsLeft
        self.temperature = temperature
        self.sold = sold
        self.seatPosition = seatPosition
        self.currentBidder = currentBidder
        self.compartment = compartment
        self.price = price
    }
    
    func printSeat() {
        print(self.column,self.row,self.minutesLeft,self.secondsLeft)
    }
    

}
