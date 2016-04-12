//  Allen Boynton
//  Album.swift
//  AOC - FinalExam
//
//  Created by Joshua Shroyer on 4/28/15.
//  Copyright (c) 2014 Full Sail University. All rights reserved.
//

import Foundation

class Album {
    // These variables should stay here
    var name: String
    var year: Int
    var songs: [String]
    
    // description computed property that should give a small description upon being accessed
    var desc: String {
        get {
            var localString = "Album \(name) was released in \(year) and has \(songs.count) songs:\n"
            for song in songs {
                localString = "\(song)\n"
            }
            
            return localString + "\n";
        }
    }
    
    init(name: String, year: Int, songs: [String]) {
        self.name = name
        self.year = year
        self.songs = songs
    }
}

