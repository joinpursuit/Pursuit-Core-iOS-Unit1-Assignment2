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

func restart (){
    print("""
    💀 Welcome to HANGMAN! 💀

    I have chosen a word for you.
    You have 6 guesses to type in the correct answer.
    """)
    let answer1 = readLine()?.lowercased() ?? "a"
    if answer1.count != 1 {
        print("Please enter 1 character at a time")
    }
        randomWord = Array(allTheWords.randomElement() ?? "Input a valid response.")
        secretWord = Array(repeating: "_", count: randomWord.count)
            guessMax = 6
}

repeat {
    var indices = Set<Int>()
//    print("Please enter a character, you have \(guessMax) guesses")
    let answer1 = readLine()?.lowercased() ?? "a"

    if answer1.count != 1 {
        print("Please enter 1 character at a time")
        continue
    }
    
    let userInput = Character(answer1) //make sure to convert to character
    
    
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
    
    
    
    if secretWord == randomWord {
        print("You win! The word was \(randomWord)")
        print("Would you like to play again? Type in 'yes' or 'no.'")
        let replayGame = readLine()?.lowercased()
        if replayGame == "yes" {
            restart()
        } else {
            print("Thank you for playing!")
        }
    }
    if !randomWord.contains(userInput) {
        guessMax -= 1
        
print("Please enter a character, you have \(guessMax) guesses")
        if guessMax == 0 {
            print("""
You LOSE!!!!! 🙁
""")
                
            print("Would you like to play again? Type in 'yes' or 'no.'")
            let replayGame = readLine()?.lowercased()
            if replayGame == "yes" {
                restart()
            } else {
                print("Thank you for playing!")
            
            
        }
    }
    }
    print(String(secretWord))
} while guessMax > 0


