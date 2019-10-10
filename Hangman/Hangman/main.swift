//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


var chances = 6
let allTheWords = ["apple", "house"]
var randomWord = allTheWords.randomElement()
var hiddenWord = Array(repeating: "_", count: randomWord?.count ?? 1)
var indices = [Int]()
var gameState = true



print("Welcome to Hangman")
sleep(1)
print("Enter a character and guess the word, You have 6 guesses")

gameLoop: while gameState == true {
    for (index, char) in hiddenWord.enumerated()  {
        let enteredChar = readLine()?.lowercased() ?? "z"
        if enteredChar == char {
            indices.append(index)
            
        }
        for (index, _) in hiddenWord.enumerated() {
            if indices.contains(index) {
                hiddenWord[index] = enteredChar
                 
            }
            }
        print(String(hiddenWord.description))
    }
    
    
    
    gameState = false
}

print(String(repeating: "_", count: randomWord?.count ?? 1))


