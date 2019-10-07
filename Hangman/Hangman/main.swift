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
print(word)

// creating hidden word:

var hiddenWord = [String]()
for _ in 1...word.count {
    hiddenWord.append("_")
}

print(hiddenWord) // "_____"

// setting number of turns:

let numTurns = word.count + 2


for _ in 1...numTurns { // Loop for number of turns
    
    print("enter letter")
    let choice = readLine() ?? "n" // User enter letter choice
    
    var counter = 0
    
    for char in word { // loops through the word
       

        if choice == String(char) { // checks if user letter is = to
            
           hiddenWord[counter] = choice
           print(hiddenWord.joined(separator:""))
            
        }
        counter += 1
        // print(counter)

    }

}


/*
 Note:
- I have to get rid of the option once its chosen by user
- Create a maskword that is the same length of the random word
e.g. randomWord = ameni
     hiddenWord = _____ // see how placement of this to other places would help.....
*/



/*
////   string into array
var myName = "ameni"
print(Array(myName))

/////    back into array
var array = ["1", "2", "3"]
print(array.joined(separator:""))
*/
