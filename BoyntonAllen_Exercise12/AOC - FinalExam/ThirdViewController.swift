//  Allen Boynton
//  ThirdViewController.swift
//  AOC - FinalExam
//
//  Created by Joshua Shroyer on 4/28/15.
//  Copyright (c) 2014 Full Sail University. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    var albums: Album?
    
    @IBOutlet weak var albumName: UITextField!
    @IBOutlet weak var yearReleased: UITextField!
    @IBOutlet weak var song1: UITextField!
    @IBOutlet weak var song2: UITextField!
    @IBOutlet weak var song3: UITextField!
    @IBOutlet weak var song4: UITextField!
    @IBOutlet weak var song5: UITextField!
    @IBOutlet weak var song6: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // Alerts user is a text field is left blank
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if albumName.text == "" || yearReleased!.text! == "" || song1.text == "" {
            
            if yearReleased.text == String(0) || yearReleased.text == "" {
                yearReleased.text = String(2015)
            }
            
            let alertUser = UIAlertController(title: "Alert", message: "Please fill in the album name, year released, and at least one song with information to continue.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let acceptButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            alertUser.addAction(acceptButton)
            
            presentViewController(alertUser, animated: true, completion: nil) // Presents the alert to the user
            
            return false
        }
        return true
        
    }
    
    
    // MARK: Keyboard functions
    
    // Next buttons will advance to the next field
    // Return button (Done) will dismiss keyboard for completion of textField6
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == albumName {
            yearReleased.becomeFirstResponder()
        }
        if textField == yearReleased {
            song1.becomeFirstResponder()
        }
        if textField == song1 {
            song2.becomeFirstResponder()
        }
        if textField == song2 {
            song3.becomeFirstResponder()
        }
        if textField == song3 {
            song4.becomeFirstResponder()
        }
        if textField == song4 {
            song5.becomeFirstResponder()
        }
        if textField == song5 {
            song6.becomeFirstResponder()
        }else {
            song6.resignFirstResponder() // dissmisses keyboard
        }
        return true
    }
    
    
    // Removes keyboard when tapping view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
