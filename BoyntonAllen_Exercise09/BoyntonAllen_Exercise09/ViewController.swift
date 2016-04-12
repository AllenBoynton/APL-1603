//
//  ViewController.swift
//  BoyntonAllen_Exercise09
//
//  Created by Allen Boynton on 3/18/16.
//  Copyright © 2016 Full Sail University. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Create constant to access my sub class
    var poolSize = PoolCharacteristics()
    
    
    // MARK: Poperties
    
    // Outlet Labels passing to and receiveing updated info from VC2
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    @IBOutlet weak var computedLabel1: UILabel!
    @IBOutlet weak var computedLabel2: UILabel!
    
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var gallonLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    // Button for INSTANCE METHOD 1
    @IBAction func getArea(sender: AnyObject) {
        
        // Called instance method value
        poolSize.incrementLengthBy(2.0)
        // String sent to new hidden label
        areaLabel.text = "My pool length increased by 2' to = \(String(poolSize.poolLength)) feet in length now."
        authorLabel.text = "App brought to you by Al Boynton"
    }
    
    // Button for instance method 2
    @IBAction func getGallons(sender: AnyObject) {
        
        // Called instance method value
        poolSize.moreSizeMoreGallons(1)
        
        // New gallons formula changes with each button tap
        gallonLabel.text = "As the depth increases by 1', the total pool gallons change to  \(String(format:"%.2f", poolSize.poolDepth * poolSize.area * poolSize.galPerCuFt)) gallons!"
    }
    
    
    // MARK: Adding Sound to button
    
    // Added sound to return button
    var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("editedSaveAndReturn", ofType: "wav")!)
    
    // Activate audio player
    var audioPlayer = AVAudioPlayer()
    
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel1.text = poolSize.poolString
        textLabel2.text = "My pool is \(String(poolSize.poolLength)) feet in length."
        textLabel3.text = "My pool is \(String(poolSize.poolWidth))feet in width."
        computedLabel1.text = "My pool is \(String(format:"%.2f", poolSize.area)) sqFt in area."
        computedLabel2.text = "My pool has \(String(format:"%.2f", poolSize.totalGallons)) gallons of water."
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: sound)
        } catch {
            fatalError("Could not create capture device input.")
        }
    }
    
    
    // Segue to send text from source to destination (labels in VC2)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! InfoViewController
        if segue.identifier == "toLocationVC" {
            destination.poolSize = poolSize
        }
        
    }
    
    
    @IBAction func editedSaveAndReturn(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! InfoViewController
        
        // Assign new edited value to labels in VC1
        textLabel1.text = source.customField1.text!
        textLabel2.text = source.customField2.text!
        textLabel3.text = source.customField3.text!
        
        audioPlayer.play()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
