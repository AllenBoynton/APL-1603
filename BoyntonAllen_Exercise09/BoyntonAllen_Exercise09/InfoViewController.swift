//
//  InfoViewController.swift
//  BoyntonAllen_Exercise09
//
//  Created by Allen Boynton on 3/18/16.
//  Copyright © 2016 Full Sail University. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITextFieldDelegate {
    
    var poolSize: PoolCharacteristics?
    
    // MARK: Poperties
    
    // Outlets that will accept the objects from the stored properties
    @IBOutlet weak var customField1: UITextField!
    @IBOutlet weak var customField2: UITextField!
    @IBOutlet weak var customField3: UITextField!
    
    
    // Variable to bridge the gap for segue when array is passed
    var passedText: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fieldArray = [customField1, customField2, customField3]
        
        //  Looping through array objects and providing info for labels
        if let array = passedText {
            for string in array {
                if let index = array.indexOf(string) {
                    if let label = fieldArray[index] {
                        label.text = string
                    }
                }
            }
        }
    }
    
    
    // MARK: Keyboard functions
    
    // Next buttons will advance to the next field
    // Return button (Done) will dismiss keyboard for completion of textField6
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == customField1 {
            customField2.becomeFirstResponder()
        }
        if textField == customField2 {
            customField3.becomeFirstResponder()
        } else {
            customField3.resignFirstResponder() // dissmisses keyboard
        }
        return true
    }
    
    // Removes keyboard when tapping view (not required, felt it could be useful)
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Returns edited text to VC1 textFields
    @IBAction func returnEdit(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Cancel button dismisses screen and returns to VC1
    @IBAction func goBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
