//
//  StringViewController.swift
//  BoyntonAllen_Exercise08
//
//  Created by Allen Boynton on 3/16/16.
//  Copyright © 2016 Full Sail University. All rights reserved.
//

import UIKit

class StringViewController: UIViewController {
    
    // Step 4a of string delegate to pass contents
    var delegate: StringViewControllerDelegate?
    
    // MARK: Poperties
    
    // Outlets that will accept the objects from the array of strings
    @IBOutlet weak var stringLabel1: UILabel!
    @IBOutlet weak var stringLabel2: UILabel!
    @IBOutlet weak var stringLabel3: UILabel!
    @IBOutlet weak var stringLabel4: UILabel!
    @IBOutlet weak var stringLabel5: UILabel!
    @IBOutlet weak var stringLabel6: UILabel!
    
    // Variable to bridge the gap for segue when array is passed
    var stringText: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arrayofLabels = [stringLabel1, stringLabel2, stringLabel3, stringLabel4, stringLabel5, stringLabel6]
        
        // Looping through array objects and providing info for labels
        if let array = stringText {
            for string in array {
                if let index = array.indexOf(string) {
                    if let label = arrayofLabels[index] {
                        label.text = string
                    }
                }
            }
        }
    }
    
    // Action to instruct what information to pass to VC1 while "reducing" the array into individual objects
    @IBAction func reduceArray(sender: UIButton) {
        var stringOfArray: [String] = []
        stringOfArray = [stringLabel1.text!, stringLabel2.text!, stringLabel3.text!, stringLabel4.text!, stringLabel5.text!, stringLabel6.text!]
        let arrayToReduce = stringOfArray.reduce("") {$0 +  " " + $1}
        delegate!.getSingleString(arrayToReduce)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Return to VC1 while dismissing current VC2
    @IBAction func goBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
