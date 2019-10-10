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


var bool = true
var randomWord: [Character] = Array(allTheWords.randomElement() ?? "Input a valid response.")
var indices = Set<Int>()
//SELECTED WORD
var secretWord: [Character] = Array(repeating: "_", count: randomWord.count)
print(secretWord)
let alphabets = Set("abscedghijklmnopqrstuvwxyz")
//to compare answer
print(randomWord)


repeat {
    
    let answer1 = readLine()?.lowercased() ?? "a"
    let userInput = Character(answer1) //make sure to convert to character
    
    for (index, char) in randomWord.enumerated(){
        if userInput == char {
            indices.insert(index)
            for (index, _) in secretWord.enumerated(){
                if indices.contains(index){
                    secretWord[index] = userInput
                    indices.remove(index)
                }
            }
        }
    }
    if userInput != randomWord.enumerated(){
        guessMax -= 1
        print(guessMax)
        //            print("wrong")
    }
    print(String(secretWord))
    print(indices)
}
    while bool == true


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

