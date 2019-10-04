//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
let allTheWords = ["able", "about", "account"]

let word = allTheWords.randomElement() ?? "ameni"

print("enter letter")
var choice = readLine()

var gappedWord = ""

for char in word {
    if choice == String(char) {
        // print("The letter was found")
        // here is where i have to spit the gappedWord
        for charac in word {
            if charac == "a"{
                gappedWord += String(charac)
            } else {
                gappedWord += "_"
            }
            
        }
        print(gappedWord)
    }
}

