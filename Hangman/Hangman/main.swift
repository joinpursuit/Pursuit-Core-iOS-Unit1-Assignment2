//
//  main.swift
//  testing Hangman
//
//  Created by Gregory Keeley on 10/9/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

let hangManFinal = """
|------
|/    |
|     0
|    /|\\
|    /\\
=========
"""

let hangManEmpty = """
|------
|/    |
|
|
|
=========
"""

let hangMan1 = """
|------
|/    |
|     0
|
|
=========
"""

let hangMan2 = """
|------
|/    |
|     0
|     |
|
=========
"""
let hangMan3 = """
|------
|/    |
|     0
|    /|
|
=========
"""
let hangMan4 = """
|------
|/    |
|     0
|    /|\\
|
=========
"""
let hangMan5 = """
|------
|/    |
|     0
|    /|\\
|    /
=========
"""


//============================================================================================================

let words = ["Greg"] //Initializes array of random words
var randomWord = words.randomElement()?.lowercased() ?? "ERROR" // Pulls a random word from the array
var underscoresFromRandomWord:[Character] = Array(String(repeating: "_", count: randomWord.count)) // Turns the random word into underscores in an array
var hiddenWord = String(underscoresFromRandomWord) // turns the array of underscores into a string, for the player to see
var maxGuesses = 5 // Sets the maximum amount of guesses to 6
var guessCounter = 0 // Starts a counter for how many attempts the player has made
var lettersGuessed = "" // Starts a blank string(Should this be an array?) to keep track of the letters guessed
var repeatCondition = true // Set the while loop
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var indices = [Int]()
var correctGuess = ""
var winWord = String(underscoresFromRandomWord)
func resetGame() -> () {
    randomWord = words.randomElement()?.lowercased() ?? "ERROR"
    underscoresFromRandomWord = Array(String(repeating: "_", count: randomWord.count))
    hiddenWord = String(underscoresFromRandomWord)
    lettersGuessed = ""
    guessCounter = 0
    repeatCondition = true
}

print("Give it a shot, guess letter")
print()
print("Cheat: \(randomWord)") // dont forget to take out
print()
print(hangManEmpty)





repeat {
    
    
    let userInput = readLine()?.lowercased() ?? "" // user Input readLine
    // print(hiddenWord) // take out when done

    if userInput.count > 1 || !alphabet.contains(userInput) || correctGuess.contains(userInput) || lettersGuessed.contains(userInput) { // If user enters more than 1 character or anything else - reject
        print("you have entered a #, more than one character, a letter you have already guessed, or nothing, please try again")
        continue
    }
    if randomWord.contains(userInput) { // takes user input, if correct appends index key to indices var
        print("You made a correct guess!")
        for (index, char) in randomWord.enumerated() {
            if userInput.contains(char) {
                indices.append(index)
                correctGuess.append(userInput)
            }
        }
        for (index, _) in underscoresFromRandomWord.enumerated() { // replaces respective index value (provided indices) with userinput
            if indices.contains(index) {
                underscoresFromRandomWord[index] = Character(userInput)
            }
        }
        indices.removeAll()
        print(String(underscoresFromRandomWord)) // Prints string from the array of characters
    }
    if !randomWord.contains(userInput) {
        print("This word does not contain that character, try again")
        guessCounter += 1
        lettersGuessed.append(userInput)
    }
    print()
    // print("you have already guessed that letter: \(lettersGuessed)")
    if guessCounter > maxGuesses {
        //repeatCondition = false
        print("You stink loser!")
        //sleep(1)
        print("Would you like to play again?")
        let losePrompt = readLine()?.lowercased() ?? "no"
        if losePrompt == "yes" {
            resetGame()
        } else {
            print("Goodbye!")
            break
        }
    }
    if guessCounter == 0 {
        print(hangManEmpty)
    }
    if guessCounter == 1 {
        print(hangMan1)
    }
    if guessCounter == 2 {
        print(hangMan2)
    }
    if guessCounter == 3 {
        print(hangMan3)
    }
    if guessCounter == 4 {
        print(hangMan4)
    }
    if guessCounter == 5 {
        print(hangMan5)
    }
    if guessCounter > 5 {
        print(hangManFinal)
    }
    print("Incorrect letters guessed: \(lettersGuessed)")
} while repeatCondition
