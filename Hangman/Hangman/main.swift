//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


var chances = 6
let allTheWords = ["apple"]
let alphabet: Array<Character> = ["a","b", "c", "d","e", "f", "g" ,"h", "i" , "j", "k","l" ,"m", "n", "o", "p", "q", "r", "s", "t", "u" , "v" , "w", "x", "y", "z" ]
var randomWord = allTheWords.randomElement() ?? "able"
var hiddenWord: Array<Character> = Array(repeating: "_", count: randomWord.count )
var gameState = true



print("Welcome to Hangman")
sleep(1)
print("Enter a character and guess the word, You have 6 guesses")
gameLoop: while gameState == true {
    var indices : Set<Int> = []
    
    let enteredChar = Character((readLine()?.lowercased() ?? "!"))
    for (index, char) in randomWord.enumerated() {
        if alphabet.contains(enteredChar) {
            if enteredChar == char {
                indices.insert(index)
                
            }
            
        } else {
            print("Enter a letter")
            continue gameLoop
        }
        
     
    }
    
    for (index, _) in hiddenWord.enumerated() {
             if indices.contains(index) {
                 hiddenWord[index] = enteredChar
                 
             }
         }
         print(String(hiddenWord.description))
    
    
}




