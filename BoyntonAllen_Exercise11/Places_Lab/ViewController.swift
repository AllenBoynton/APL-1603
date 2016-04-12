//  
//  Allen Boynton
//  APL 1603
//  Code Exercise 11
//
//  ViewController.swift
//  Places_Lab
//
//  Created by Joshua Shroyer on 2/23/15.
//  Copyright (c) 2015 Full Sail University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // all of our locations
    var locations: [Location] = []
    
    // the index of the location we selected set it to 0
    var locationSelection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // build our locations and add to our list
        // get the descriptions of each location
        let locationDescriptions = buildDescriptions()
        
        // get the images
        let parisImage = UIImage(named: "paris.jpg")
        let londonImage = UIImage(named: "london.jpg")
        let barcelonaImage = UIImage(named: "barcelona.jpg")
        let mauiImage = UIImage(named: "maui.jpg")!
        let newYorkImage = UIImage(named: "new_york.jpg")
        let sanFranciscoImage = UIImage(named: "san_francisco.jpg")
        
        // build the location objects
        let paris = Location(name: "Paris", image: parisImage, description: locationDescriptions["Paris"]!)
        let london = Location(name: "London", image: londonImage, description: locationDescriptions["London"]!)
        let barcelona = Location(name: "Barcelona", image: barcelonaImage, description: locationDescriptions["Barcelona"]!)
        let maui = Location(name: "Maui", image: mauiImage, description: locationDescriptions["Maui"]!)
        let newYork = Location(name: "New York", image: newYorkImage, description: locationDescriptions["New York"]!)
        let sanFrancisco = Location(name: "San Francisco", image: sanFranciscoImage, description: locationDescriptions["San Francisco"]!)
        
        // load the array with these locations
        locations = [paris, london, barcelona, maui, newYork, sanFrancisco]
    }
    
    @IBAction func locationButton(sender: AnyObject) {
        let selectedButton = sender as! UIButton
        locationSelection = selectedButton.tag
        performSegueWithIdentifier("toLocationVC", sender: sender)
    }
    
    @IBAction func randomLocation(sender: AnyObject) {
        locationSelection = Int(arc4random_uniform(UInt32(locations.count)))
        print(locations.count)
        performSegueWithIdentifier("toLocationVC", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toLocationVC" {
            let lVC = segue.destinationViewController as! LocationViewController
            lVC.selectedLocation = locations[locationSelection]
        }
        
    }
    
    // build the descriptions as to not clutter viewDidLoad
    // Returns a Dictionary of the description using the location as the key
    // HINT: There is nothing wrong with this function, so don't modify it. :)
    private func buildDescriptions() -> [String : String] {
        let parisDescription = "The City of Light draws millions of visitors every year with its unforgettable ambiance. Of course, the divine cuisine and vast art collections deserve some of the credit as well. The gentle River Seine rambles through the city, flanked by stately museums, centuries-old churches, and blocks of Rococo- and Neoclassic-design architecture, further enhanced by charming trees and glowing streetlamps. Peppering the Seine's cobbled walks and graceful bridges are impossibly chic Parisians, probably on their way to the market, cafe or cinema.\n\nContaining world-class museums, fashion, cuisine, and an atmosphere all its own, Paris is also a city of \"many splendors,\" as Ernest Hemingway recalled in his memoir, \"A Moveable Feast.\" Visit the Centre Pompidou, enjoy gourmet pastries, shop couture on the Champs Élysées or hit the boutiques in Les Halles, take in the view atop the Eiffel Tower, or even plan a day trip to Versailles Palace. But don't miss out on the simple pleasure of meandering the marvelous arrondissements (districts)."
        
        let londonDescription = "The English writer Samuel Johnson famously said, \"You find no man, at all intellectual, who is willing to leave London. No, Sir, when a man is tired of London, he is tired of life; for there is in London all that life can afford.\" More than two centuries have passed since Johnson's era, but his words still ring true. Life in London is invigorating, and travelers find that one visit isn't enough to experience everything this two-millennia-old city has to offer.\n\nHere, the antiquated clasps hands with the contemporary. You'll find the historic Tower of London and the avant-garde Tate Modern both considered must-sees. Shakespeare's sonnets are still being uttered by actors who don modern garb. Londoners most certainly still revere the royals, but they also rock out to Coldplay and Lily Allen. And while they still sip tea, they now drink Starbucks, too. A current leader in everything from politics and banking to fashion and music, London's culture compass is always attuned to what's next."
        
        let barcelonaDescription = "Barcelona contains both the authentically historic and the wildly bizarre. From the tree-lined Las Ramblas to the narrow alleys of Barri Gòtic; from the beachside nightclubs to the city's dozens of sacred churches and cathedrals, this city by the sea seems to attract all types: the family, the adventurer, the couple, the backpacker, the culture lover — and more — with an almost overwhelming variety of things to do. You could stay for a few days, but chances are you'll need a whole week to explore.\n\nIn Barcelona, even the beach is bustling, but it's really the cosmopolitan city that gets all the attention. Much of the activity revolves around Las Ramblas, a series of narrow streets and alleys packed with restaurants, nightclubs and a vibrant pedestrian market. But you should also take a tour of Antoni Gaudí's masterpieces; Gaudí is responsible for sites like Parc Güell, Casa Batlló and La Sagrada Familia. And it would also be absurd to miss out on the eclectic shopping scene and the region's exquisite food and wine. Do you see why we suggest a week vacation?"
        
        let mauiDescription = "Maui is not nearly as large as the Big Island, nor is it as small as Lanai, as bustling as Oahu or as quiet as Kauai. For many Hawaii vacationers, Maui is just right — offering a taste of just about everything the Aloha State has to offer, from impressive wildlife to intriguing history and culture. While on a visit here, you can shimmy alongside professional hula dancers, golf along coastal fairways, snorkel alongside five different types of sea turtles or simply lounge along some of Hawaii's most notable beaches.\n\nOne of the archipelago's most popular tourism spots, Maui can be found sandwiched between the Big Island and the much tinier Molokai. Maui is divided into five distinct regions: Many travelers base themselves along the coasts of South Maui (home to the famous Wailea Beach) or West Maui, where the sands of Kaanipali Beach and the music from the Old Lahaina Luau are located. But the rest of the island should not be missed. Travel along the Road to Hana to experience East Maui's scenic coastline, explore Haleakala — the world's largest dormant volcano — in the Upcountry, and explore the former tribal battlegrounds of Central Maui's Iao Valley State Park."
        
        let newYorkDescription = "Cool, cosmopolitan, crowded, constantly evolving … the Big Apple blends big-city splendor with small-town charm. Amid Gotham's iconic landmarks and towering skyscrapers, you'll experience a vibrant culture permeating each of the city's distinctive neighborhoods and boroughs. Follow trendsetters to the East Village and Brooklyn to check out indie boutiques, iconic bakeries and trendy coffee shops. Afterward, peruse the racks of the sleek shops lining Fifth Avenue, admire the cutting-edge art collections at the MoMa and the Met, catch a memorable show on Broadway or sit down for a meal at the latest \"it\" restaurant.\n\nAs the most populous city in the U.S. — set at the forefront of food, fashion and the arts — NYC requires stamina. But don't let the Big Apple's frenetic sights and sounds intimidate you from soaking up its grandeur. Wander through the concrete jungle and you'll discover roaring taxicabs pouring down bustling blocks, fast-paced pedestrians whizzing past on their way to marquee galleries and innovative cocktail bars and Times Square's neon lights flickering at all hours. And yet, the city's twinkling lights and chaotic corners also invite you to embrace every New York minute, explore every flourishing enclave and create your own urban adventure. There are virtually endless ways to occupy your time in the city that never sleeps, but before you leave, stop and look around — what's here today will be transformed into something bigger and better tomorrow."
        
        let sanFranciscoDescription = "A jumbled collage of colorful neighborhoods and beautiful views, San Francisco draws those free-spirited types who have an eye for edgy art, a taste for imaginative cuisine and a zeal for adventure. It's really not surprising that songwriter Tony Bennett left his heart here: The city boasts jaw-dropping sights, world-class cuisine, cozy cafes and plenty of booming nightlife venues — there's no shortage of ways to stay busy here. Spend an hour or two sunning yourself alongside sea lions on the bay, admiring the views of the city from Twin Peaks, or strolling along the Marina. And for the quintessential San Franciscan experience, enjoy a ride on a cable car.\n\nOften described as Los Angeles' more refined northern cousin, cool and compact San Francisco takes the big-city buzz exuded by its southern counterpart and melds it with a sense of small-town charm. Here, you'll discover a mish-mash of culture flourishing throughout San Francisco's many vibrant quarters. Follow the crowds to the touristy Fisherman's Wharf area (which offers spectacular views of Alcatraz) before heading along the bay to the Presidio for a glimpse of the famous Golden Gate Bridge. But don't forget to save time for the Mission district, The Haight and The Castro for exposure to all of the different varieties of the San Francisco lifestyle."
        
        return ["Paris": parisDescription, "London": londonDescription, "Barcelona": barcelonaDescription, "Maui": mauiDescription, "New York": newYorkDescription, "San Francisco": sanFranciscoDescription]
    }
    
}

