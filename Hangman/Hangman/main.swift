//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle"]

/*var mysteryWord = allTheWords.randomElement() ?? ""

var hiddenWord: [Character] = Array(repeating: "_", count: mysteryWord.count)

print("Welcome to Hangman!!")

sleep(2)

print("You have 6 tries to guess the mystery Word")

sleep(2)

print(String(hiddenWord))
//print(mysteryWord) // code this out later




var userInput = ""

var guessMaximum = 6

var indices: Set<Int> = []
var foundWord = ""
var playerIsPlaying = true

var arrayOfMysteryWord = Array(mysteryWord)

/*var alphabet:Set
<Character>=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]*/

var correctGuess = false

print("Are You Ready?! Guess a Letter!")*/


var playerIsPlaying = true
var playerChoice = ""
var playerIsNotPlaying = false

print("Welcome to Hangman!!")
sleep(1)

print("Would You Like To Get Started ?! Type \"Yes\" or \"No\"")

playerChoice = readLine()?.lowercased() ?? ""

if playerChoice == "yes" {
    playerIsPlaying = true
    print("Awesome!!")
} else if playerChoice == "no" {
   
    print("See You next Time!")
    playerIsNotPlaying = false
}

while playerIsPlaying {
    
    let mysteryWord = allTheWords.randomElement() ?? ""

    var hiddenWord: [Character] = Array(repeating: "_", count: mysteryWord.count)


    print("You have 6 tries to guess the mystery Word")

    sleep(2)

    print(String(hiddenWord))
    //print(mysteryWord) // code this out later




    var userInput = ""

    var guessMaximum = 6

    var indices: Set<Int> = []
    var foundWord = ""
    var playerIsStillPlaying = true

    var correctGuess = false

    print("Are You Ready?! Guess a Letter!")


repeat  {
    
userInput = readLine()?.lowercased() ?? ""
    
//checks if userr input is equal to character in random element
    
 for (index,char) in mysteryWord.enumerated() {

            if userInput == String(char) {
        
                indices.insert(index)
                
                correctGuess = true
                //print("Great!")
                
    }
}
    // tells player if guess is wrong and decreases guess.
    
    if correctGuess == false {
        guessMaximum-=1
        print ("Sorry! Wrong letter. You have \(guessMaximum) guesses left! ")
        
    }
    // replaces "_" with userinput if its correct
            for (index,char) in hiddenWord.enumerated() {
    
                if indices.contains(index) && char == Character("_") {
                    
                    
                    hiddenWord[index] = Character(userInput)
                    
                    
                    foundWord = String(hiddenWord)
                    
                    
                }

            
            }
   print(foundWord)
    
    correctGuess = false
    //print("\(indices.count) is the same as \(mysteryWord.count)")
}
    
    while guessMaximum > 0 && (indices.count < mysteryWord.count)

    if indices.count == mysteryWord.count  {
        print("AWESOME!!! 🥳🥳🥳🥳🥳🎉🥳🥳🥳🥳🥳 YOU WIN!!!")
    }

print("If you'd like to play again, type \"Yes\" ")
    
    userInput=readLine()?.lowercased() ?? ""
    
if userInput == "yes" {
    
    playerIsStillPlaying = true
    
} else if userInput == "no" {
    playerIsStillPlaying = false
    
    print("See you next time")
    break
    }

}


