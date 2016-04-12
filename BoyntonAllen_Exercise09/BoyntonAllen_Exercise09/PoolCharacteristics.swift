//
//  PoolArea.swift
//  BoyntonAllen_Exercise09
//
//  Created by Allen Boynton on 3/22/16.
//  Copyright © 2016 Full Sail University. All rights reserved.
//

import Foundation

//Instance methods performing the useful functionality of finding pool gallons
class PoolCharacteristics {
    
    // Required 3 Stored properties
    var poolString: String
    var poolLength: Double
    var poolWidth : Float
    var poolDepth : Double
    var galPerCuFt: Double
    
    
    // Default Initializer
    init() {
        poolString = "Swimming pools are a great party setting!"
        poolLength = 40.75
        poolWidth  = 20.55
        poolDepth  = 5.5
        galPerCuFt = 7.48 // 7.48 cubic feet = 1 gallon of water
    }
    
    // One that allows the user to set all properties
    init(environment: String, length: Double, width: Float, depth: Double, cuFt: Double) {
        poolString = environment
        poolLength = length
        poolWidth  = width
        poolDepth  = depth
        galPerCuFt = cuFt
    }
    
    
    // 1 of 2 Required Computed properties
    var area: Double {
        return poolLength * Double(poolWidth)
    }
    
    // 2 of 2 Required Computed properties
    var totalGallons: Double {
        return area * poolDepth * galPerCuFt
    }
    
    // Instance method using function to increment length of pool
    func incrementLengthBy(amount: Double) {
        poolLength += amount        
    }
    
    // Instance method using function to use new length to find new gallonage
    func moreSizeMoreGallons(amount: Double) {
        poolDepth += amount
    }
}

    
// Example of an Instance method as opposed to what I used - unknown if mine is correct **
//    var numberOfCandy: Int = 0
//    var pricePerCandy: Double = 0.99
//    
//    func getTotalPrice() -> Double {
//        return (Double(numberOfCandy) * pricePerCandy)
//    }
//    
//    init(candies: Int, price: Double) {
//        self.numberOfCandies = candies
//        self.pricePerCandy = price
//    }
    