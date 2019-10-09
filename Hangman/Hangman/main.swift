//
//  main.swift
//  Hangman
//
//  Created by Bienbenido Angeles on 10/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
//array of words to choose
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against"]
let hangManDrawing = [
    """
""", """
""", """
""", """
""", """
""", """
"""
]
print("You have a total of six attempts to guess a random word that the computer chooses or else you'll loose the game")

//AI chooses word from an array of strings

var gameContinueState = false
var numOfAttempts = 6

repeat {
    
 //   let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var validAIWord = String()

    let computerChoiceOfWord = allTheWords.randomElement()
    if let unwrappedRandomWord = computerChoiceOfWord {
        validAIWord = unwrappedRandomWord
    } else {
        print("There is no random word to choose from")
    }

    //generate the word to have _ on each char
//    for _ in validAIWord{
//        print("_", terminator: " ")
//    }

    let userInputGuesses = Character(readLine() ?? "Nil value is returned")
    

    //If AI loses the game print the word
    print("Computer choose the word: \(validAIWord)")
    
    //game state restart
    print("Would you like to play again?, you can only enter \"yes\" or \"no\" ")
    
    let userInputPlayAgain = readLine() // gets player input if they want to play again or not
    if let validUserInputPlayAgain = userInputPlayAgain{
        if validUserInputPlayAgain.lowercased() == "yes" {
            gameContinueState = true
        } else if validUserInputPlayAgain.lowercased() == "no" {
            gameContinueState = false
        }
    } else {
        print("Valid \"yes\" or \"no\" response not detected")
    }
} while (gameContinueState)

