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
    var validAiWord = String()

    let computerChoiceOfWord = allTheWords.randomElement()
    if let unwrappedRandomWord = computerChoiceOfWord {
        validAiWord = unwrappedRandomWord
    } else {
        print("There is no random word to choose from")
    }
    
 //   String(repeating: "_", count: validAiWord.count) // used to print "_" for number of characters in the word
    
    //places characters of AIs word in a array
    var charsOfChosenWord:[Character] = []
    for char in validAiWord {
        charsOfChosenWord.append(char)
    }

    //get character of what the user inputs
    let userInputGuesses = Character(readLine() ?? "Nil value is returned")
    
    //array to keep track of what character values the user has entered

    //Check to see if char the user choosed is within an array of characters that corresponds to the word the AI choosed
    if charsOfChosenWord.contains(userInputGuesses) {
        
    } else if !charsOfChosenWord.contains(userInputGuesses){
        numOfAttempts -= 1
    }

    //If user loses the game print the word
    if numOfAttempts == 0 {
        print("Computer choose the word: \(validAiWord)")
        //game state restart
        print("Would you like to play again?, you can only enter \"yes\" or \"no\" for now")
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
    }
} while (gameContinueState)
