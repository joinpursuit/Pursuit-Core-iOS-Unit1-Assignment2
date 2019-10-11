//
//  main.swift
//  Hangman
//
//  Created by Bienbenido Angeles on 10/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
//array of words to choose
let allTheWords = [ "addition", "adjustment", "advertisement"]
let hangManDrawing = [
    """
""", """
""", """
""", """
""", """
""", """
"""
]


//AI chooses word from an array of strings


var gameState = true
var gameRestart = false
var repeatOnlyForAttempts = true
print("You have a total of six attempts to guess a random word that the computer chooses or else you'll lose the game")


repeat {
    
    var numOfLosses = 0
    var numOfAttemptsRemaining = 6
    let randomAiWord = allTheWords.randomElement()
    var validAiWordAsString = ""
    if let validRandomAiWord = randomAiWord {
        validAiWordAsString = validRandomAiWord
    } else {
        print("There is no random word to choose from")
    }
    
    var dashesOfWord:[Character] = Array(repeating: "_", count: validAiWordAsString.count)
    print(validAiWordAsString)

    repeat {
        //get character of what the user inputs
        let userInputGuesses = readLine() ?? ""
        
        //places characters of AIs word in a array

        //switch underscores with the correct char at the correct index of dashesOfWord
        for (index, char) in validAiWordAsString.enumerated() {
            if validAiWordAsString.contains(userInputGuesses) {
                if char == Character(userInputGuesses){
                dashesOfWord[index] = char
                }
    //            print(dashesOfWord)
            }
        }
        
        //Counts the number of attempts you have remaining
        if !validAiWordAsString.contains(userInputGuesses){
           numOfAttemptsRemaining -= 1
           print("You currently have \(numOfAttemptsRemaining) attempts remaining")
        }
        print(dashesOfWord)

        print(userInputGuesses)

        //If user loses the game print the word
        if numOfAttemptsRemaining == 0 {
            print("Computer choose the word: \(validAiWordAsString)")
            repeat {
                print("Would you like to play again?, you can only enter \"yes\" or \"no\" for now")
                let userInputPlayAgain = readLine() // gets player input if they want to play again or not
                if let validUserInputPlayAgain = userInputPlayAgain{
                    if validUserInputPlayAgain.lowercased() == "yes" {
                          gameState = true
                    } else if validUserInputPlayAgain.lowercased() == "no" {
                        repeatOnlyForAttempts = false
                        gameState = false
                    }
                } else {
                      print("Valid \"yes\" or \"no\" response not detected")
                }
            } while gameRestart
        }
        
            
    } while repeatOnlyForAttempts
    //repeat this so long as user enters a yes or no response correctly
  
    //game state restart
} while (gameState)
