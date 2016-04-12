//
//  Allen Boynton
//  APL 1603
//  Code Exercise 11
//
//  LocationViewController.swift
//  Places_Lab
//
//  Created by Joshua Shroyer on 2/23/15.
//  Copyright (c) 2015 Full Sail University. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UITextViewDelegate {
    
    var selectedLocation: Location? = nil
    
	@IBOutlet weak var locationImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationDescription: UITextView! // Added textView
		
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Added connections
        locationImage.image = selectedLocation?.image
        nameLabel.text = selectedLocation?.name
        locationDescription.text = selectedLocation?.desc

    }
    
	@IBAction func goBack(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
    
}
