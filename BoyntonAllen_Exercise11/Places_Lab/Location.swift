//
//  Allen Boynton
//  APL 1603
//  Code Exercise 11
//
//  Location.swift
//  Places_Lab
//
//  Created by Joshua Shroyer on 2/23/15.
//  Copyright (c) 2015 Full Sail University. All rights reserved.
//

import UIKit

class Location {
    
	var name: String
    var image: UIImage?
	private var description: String
    
    
    var desc: String  {
		return description + "\n\n\nThis Description and Images Provided by http://www.travel.usnews.com"
	}
    
	
	init(name: String, image: UIImage?, description: String) {
		self.name = name
		self.image = image
		self.description = description
	}
}
