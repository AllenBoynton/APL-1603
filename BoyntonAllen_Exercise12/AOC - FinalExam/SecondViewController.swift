//  Allen Boynton
//  SecondViewController.swift
//  AOC - FinalExam
//
//  Created by Joshua Shroyer on 4/28/15.
//  Copyright (c) 2014 Full Sail University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextViewDelegate {
    
    // *cough* used for "Referencing" the artist that was selected in the first ViewController
    var artists: Artist? = nil
    
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistDescription: UITextView!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        artistDescription.text = album.name
//        artistDescription.text! = String(.songs)
//        artistDescription.text = String(album.year)
        
        artistImage.image = artists?.image
        artistDescription.text = artists?.genre
        artistDescription.text = artists?.description
        artistLabel.text = artists?.name
        
    }
    
    // Pulls the entered user data from UsersVC and enters it into the textView
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let source = unwindSegue.sourceViewController as! ThirdViewController
        
        artistDescription.text = artistDescription.text + "\n" + source.albumName.text!
        artistDescription.text = artistDescription.text + "\n" + source.yearReleased.text!
        artistDescription.text = artistDescription.text + "\n" + source.song1.text!
        artistDescription.text = artistDescription.text + "\n" + source.song2.text!
        artistDescription.text = artistDescription.text + "\n" + source.song3.text!
        artistDescription.text = artistDescription.text + "\n" + source.song4.text!
        artistDescription.text = artistDescription.text + "\n" + source.song5.text!
        artistDescription.text = artistDescription.text + "\n" + source.song6.text!
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
