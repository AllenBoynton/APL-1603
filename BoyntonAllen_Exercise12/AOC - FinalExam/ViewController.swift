//  Allen Boynton
//  ViewController.swift
//  AOC - FinalExam
//
//  Created by Joshua Shroyer on 4/28/15.
//  Copyright (c) 2014 Full Sail University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var artists: [Artist] = []
    
    // the index of the location we selected
    var artistSelection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beatlesImage = UIImage(named: "Beatles.jpg")
        let rollingStonesImage = UIImage(named: "Roll_Stone.jpg")!
        let ledZepplinImage = UIImage(named: "Led_Zepplin.jpg")
        let pinkFloydImage = UIImage(named: "Pink_Floyd.jpg")!
        let queenImage = UIImage(named: "Queen.jpg")
        
        let beatles = Artist(name: "Beatles", genre: "Rock", image: beatlesImage)
        let rollingStones = Artist(name: "Rolling Stones", genre: "Blues Rock", image: rollingStonesImage)
        let ledZepplin = Artist(name: "Led Zepplin", genre: "Hard Rock", image: ledZepplinImage!)
        let pinkFloyd = Artist(name: "Pink Floyd", genre: "Progressive Rock", image: pinkFloydImage)
        let queen = Artist(name: "Queen", genre: "Rock", image: queenImage)
        
        artists = [beatles, ledZepplin, queen, pinkFloyd, rollingStones]
    }
    
    @IBAction func artistButtonTapped(sender: AnyObject) {
        // Used the tag property of the button pressed to know which Artist to send over. Start at 1, 0 is default.
        let selectedArtist = sender as! UIButton
        artistSelection = selectedArtist.tag
        performSegueWithIdentifier("ToSecondViewController", sender: sender)
    }
    
    @IBAction func randomArtist(sender: AnyObject) {
        artistSelection = Int(arc4random_uniform(UInt32(artists.count)))
        performSegueWithIdentifier("ToSecondViewController", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToSecondViewController" {
            let secondVC = segue.destinationViewController as! SecondViewController
            secondVC.artists = artists[artistSelection]
        }
        // pass a "Reference" of the selectedArtist over to the secondViewController so it can be updated elsewhere but still change our information here.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

