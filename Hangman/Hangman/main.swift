//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

print("""
💀 Welcome to HANGMAN! 💀
I have chosen a word for you.
You have 6 guesses to type in the correct answer.
""")

let allTheWords = ["acid", "across", "addition", "adjustment", "advertisement", "beautiful", "because", "before", "behaviour", "belief", "company", "comparison", "competition", "complete", "complex", "cheese", "development", "different", "digestion", "direction", "dirty", "discovery"]

var guessMax = 6

var randomWord: [Character] = Array(allTheWords.randomElement() ?? "Input a valid response.")
//SELECTED WORD
var secretWord: [Character] = Array(repeating: "_", count: randomWord.count)
print(secretWord)
//to compare answer
print(randomWord)
var indices = Set<Int>()

func restart (){
    
}

repeat {
    indices = Set<Int>() // resets here
    
    print("Please enter a character, you have \(guessMax) guesses")
    let answer1 = readLine()?.lowercased() ?? "a"

    if answer1.count != 1 {
        print("Please enter 1 character at a time")
        continue
    }
    
    let userInput = Character(answer1) //make sure to convert to character
    
    if !randomWord.contains(userInput) {
        guessMax -= 1
    }
    
    // go through the random word and keep track of indices where
    // entered character is
    for (index, char) in randomWord.enumerated(){
        if userInput == char {
            indices.insert(index)
        }
    }
    
    // update secret word to indices found above
    for (index, _) in secretWord.enumerated(){
        if indices.contains(index){
            secretWord[index] = userInput
        }
    }
    
    print(String(secretWord))
} while guessMax > 0



//for guess in guessMax {
//    guessMax -= 1
//    }
//}

//this is in the repeat statement


// this is for user ans comparison
//for char in allTheWords{
//    if char.contains(){
//        print(char)
//    }
//}

