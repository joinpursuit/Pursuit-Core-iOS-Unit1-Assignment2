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
var emptyArr: [Character]


print("Welcome to Hangman")
sleep(1)

gameLoop: while gameState == true && chances > 0{
    var indices : Set<Int> = []
    print("Enter a character, You have \(chances) guesses")
    let enteredChar = Character((readLine()?.lowercased() ?? ""))
    for (index, char) in randomWord.enumerated() {
        if alphabet.contains(enteredChar) {
            if enteredChar == char {
                indices.insert(index)
               
                
            }
            
        }  else {
            print("Enter a letter")
            continue gameLoop
        }
       
        
     
    }
    
    for (index, _) in hiddenWord.enumerated() {
             if indices.contains(index) {
                 hiddenWord[index] = enteredChar
                
             } else if randomWord.contains(hiddenWord.description) {
                         print("you win")
             
             }
        
   
    }
         print(String(hiddenWord.description))
     
    
}




