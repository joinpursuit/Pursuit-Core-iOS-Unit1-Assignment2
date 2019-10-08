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

//let word = allTheWords.randomElement() ?? "bob"
let word = "alla"
print(word)

// creating hidden word:

var hiddenWord = [String]()
for _ in 1...word.count {
    hiddenWord.append("_")
}

// print(hiddenWord) // array
print(hiddenWord.joined(separator:"")) // String
var hiddenWordString: String

// setting number of turns:

let maxWrong = 6
var wrongCount = 0


// creating animation function:

func animation(wrongCount: Int){
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


repeat { // Loop for number of turns
    
    print("enter letter")
    let choice = readLine() ?? "n" // User enter letter choice
    
    if alphabet.contains(choice) {
    var counter = 0
    
    if word.contains(choice) { // checks if word contains the letter entered
        
    for char in word { // loops through the word
       

        if choice == String(char) { // checks if user letter is = to
           hiddenWord[counter] = choice
        }
        counter += 1
        // print(counter)
    }
         print(hiddenWord.joined(separator:""))
        
    } else {
        print("Not Found!") // **this is where i will add the animation of hanging.**
        wrongCount += 1
        animation(wrongCount: wrongCount)
        
    }
    // print(alphabet)
    let letterIndex = alphabet.index(of: choice)
    //print(letterIndex)
    alphabet.remove(at: letterIndex ?? 2)
    // print(alphabet) // Prints alphabets after chosen letters have been removed.
    
    } else {
        print("Has already been chosen, try again.")
    }

    hiddenWordString = hiddenWord.joined(separator:"")

} while wrongCount < maxWrong && word != hiddenWordString

// END OF GAME OUTPUT: YOU WIN OR LOSE

if wrongCount >= maxWrong {
    print("GAME OVER - YOUVE BEEN HUNG")
} else if word == (hiddenWord.joined(separator:"")) {
    print("YAY! You win")
}






