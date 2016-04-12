//
//  ViewController.swift
//  BoyntonAllen_Exercise08
//
//  Created by Allen Boynton on 3/16/16.
//  Copyright © 2016 Full Sail University. All rights reserved.
//

import UIKit

// Step 2 of string delegate - implemented the delegate
class ViewController: UIViewController, UITextFieldDelegate, StringViewControllerDelegate {
    
    // MARK: Poperties
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: StringViewControllerDelegate
    
    // Step 3 of getting the strings
    func getSingleString(data: String) {
        displayLabel.text = data
    }
    
    // 1. Segue to send text from source to destination (labels in VC2)
    // 2. Step 4 of building my custom string delegate
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Passing data
        let destination2 = segue.destinationViewController as! StringViewController
        let arrayOfTextFields = [textField1.text!, textField2.text!, textField3.text!, textField4.text!, textField5.text!, textField6.text!]
        destination2.stringText = arrayOfTextFields
        
        // Custom delegate returning string to label
        let destination = segue.destinationViewController as! StringViewController
        destination.delegate = self
    }
    

    // MARK: BlankTextFields
    
    // Alerts user if a text field is left blank
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if textField1.text == "" || textField2.text == "" || textField3.text == "" || textField4.text == "" || textField5.text == "" || textField6.text == "" {
            
            let alertUser = UIAlertController(title: "Alert", message: "Please complete all fields to continue", preferredStyle: UIAlertControllerStyle.Alert)
            
            let acceptButton = UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil)
            
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
        if textField == textField1 {
            textField2.becomeFirstResponder()
        }
        if textField == textField2 {
            textField3.becomeFirstResponder()
        }
        if textField == textField3 {
            textField4.becomeFirstResponder()
        }
        if textField == textField4 {
            textField5.becomeFirstResponder()
        }
        if textField == textField5 {
            textField6.becomeFirstResponder()
        } else {
            textField6.resignFirstResponder() // dissmisses keyboard
        }
        return true
    }
    
    // Removes keyboard when tapping view (not required, felt it could be useful)
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

