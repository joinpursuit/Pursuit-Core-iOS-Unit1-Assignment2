//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//============================================================
//                       Game Start
//============================================================

print("Would you like to play Hangman? Y/N")
let gameStart = readLine()?.uppercased()

var playerGuess = readLine()
let allTheWords = ["help", "berry", "news", "guest"]
var word = allTheWords.randomElement()
let totalChances = 10
var remainingChances = 10
var usedChances = 0

repeat{
    for _ in word {
        print("_")
        print("""
        There are \(_.count) letters.
        You have \(remainingChances) remaining guesses.
        You have used \(usedChances) guesses
            """)
        
        
        
    }
    print(" ")
} while gameStart == "Y"
