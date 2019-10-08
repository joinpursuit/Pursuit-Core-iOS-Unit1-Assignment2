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

let word = allTheWords.randomElement() ?? "bob"
// let word = "alla"
// print(word)


// creating animation function:

func animation(wrongCount: Int){
    if wrongCount == 0 {
        print("""
             _____
            |     |
                  |
                  |
                  |
                 _|_
        """)
    }
    
    if wrongCount == 1 {
        print("""
             _____
            |     |
            😟    |
                  |
                  |
                 _|_
        """)
    }
    if wrongCount == 2 {
        print("""
                 _____
                |     |
                😓    |
                |     |
                |     |
                     _|_
            """)
    }
    if wrongCount == 3 {
        print("""
                 _____
                |     |
                😰    |
              //|     |
                |     |
                     _|_
            """)
    }
    if wrongCount == 4 {
        print("""
                 _____
                |     |
                😫    |
              //|\\   |
                |     |
                     _|_
            """)
    }
    if wrongCount == 5 {
        print("""
                 _____
                |     |
                😖    |
              //|\\   |
                |     |
              //     _|_
            """)
    }
    if wrongCount == 6 {
        print("""
                 _____
                |     |
                😵    |
              //|\\   |
                |     |
              // \\  _|_
            """)
    }
}

// Creating hidden word:

var hiddenWord = [String]()
for _ in 1...word.count {
    hiddenWord.append("_")
}

// print(hiddenWord) // array
print(hiddenWord.joined(separator:"")) // String
var hiddenWordString: String
var selectedLetters: [String] = []

// setting number of turns:

let maxWrong = 6
var wrongCount = 0

// Game starts:

print("""
                                                                               
 88                                                                                        88
 88                                                                                        88
 88                                                                                        88
 88,dPPYba,  ,adPPYYba, 8b,dPPYba,   ,adPPYb,d8 88,dPYba,,adPYba,  ,adPPYYba, 8b,dPPYba,   88
 88P'    "8a ""     `Y8 88P'   `"8a a8"    `Y88 88P'   "88"    "8a ""     `Y8 88P'   `"8a  88
 88       88 ,adPPPPP88 88       88 8b       88 88      88      88 ,adPPPPP88 88       88  88
 88       88 88,    ,88 88       88 "8a,   ,d88 88      88      88 88,    ,88 88       88
 88       88 `"8bbdP"Y8 88       88  `"YbbdP"Y8 88      88      88 `"8bbdP"Y8 88       88  88
                                     aa,    ,88
                                      "Y8bbdP"
                           
""")

print("Welcome to hangman!")
print("The Word: \(hiddenWord.joined(separator:""))")

// Loop for number of turns:

repeat {
    print(); sleep(1)
    print("Enter letter")
    let choice = readLine()?.lowercased() ?? "n" // User enter letter choice
    
    if alphabet.contains(choice) {
    var spotCounter = 0
    
    if word.contains(choice) { // checks if word contains the letter entered
        sleep(1); print()
        print("Found!")
        sleep(1)
        animation(wrongCount: wrongCount)
        
    for char in word { // loops through the word
       
        if choice == String(char) { // checks if user letter is = to char in word
           hiddenWord[spotCounter] = choice
        }
        spotCounter += 1
        // print(counter)
    }
         print(hiddenWord.joined(separator:""))
        
    } else {
        print(); sleep(1)
        print("Not Found!")
        print(); sleep(1)
        wrongCount += 1
        animation(wrongCount: wrongCount)
        print(); sleep(1)
        print(hiddenWord.joined(separator:""))

        
    }
    // Add choice to the already chosen array and print it
        selectedLetters.append(choice)
    // print already selected letter joined with " "
        sleep(1)
        print("Entered Letters: \(selectedLetters.joined(separator:" "))")
        
    // Remove letter from alphabat once chosen:
        
    let letterIndex = alphabet.index(of: choice)
    alphabet.remove(at: letterIndex ?? 2)
    // print(alphabet) // Prints alphabets after chosen letters have been removed.
    
    } else {
        print("Has already been chosen, try again.")
    }

    hiddenWordString = hiddenWord.joined(separator:"")

} while wrongCount < maxWrong && word != hiddenWordString

// END OF GAME OUTPUT: YOU WIN OR LOSE
// Add animation

if wrongCount >= maxWrong {
    print("GAME OVER - YOUVE BEEN HUNG")
} else if word == (hiddenWord.joined(separator:"")) {
    print("YAY! You win")
}






