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


// setting number of turns:

let maxWrong = 6
var wrongCount = 0

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
        print("Wrong")
        wrongCount += 1
    }
    // print(alphabet)
    let letterIndex = alphabet.index(of: choice)
    //print(letterIndex)
    alphabet.remove(at: letterIndex ?? 2)
    // print(alphabet) // Prints alphabets after chosen letters have been removed. 
    
    } else {
        print("Has already been chosen, try again.")
    }
    
} while (wrongCount < maxWrong)

print("GAME OVER - YOUVE BEEN HUNG")


/*
 Note:
- I have to get rid of the option once its chosen by user

*/



/*
////   string into array
var myName = "ameni"
print(Array(myName))

/////    back into array
var array = ["1", "2", "3"]
print(array.joined(separator:""))
*/

/* ==============================
var start = """
     _____
    |     |
    0     |
   /|\    |
    |     |
   / \   _|_

"""
*/
