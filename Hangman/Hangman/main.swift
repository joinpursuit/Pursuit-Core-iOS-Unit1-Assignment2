//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle"]
var mysteryWord = allTheWords.randomElement() ?? ""
var hiddenWord = String(repeating: "_", count: mysteryWord.count)
print("Welcome to Hangman!!")

sleep(2)
print("You have 6 tries to guess the mystery Word")
sleep(2)
print(hiddenWord)
print("Are You Ready?! Guess a Letter!")


var userInput = readLine()

userInput = readLine()

var guessMaximum = 6
var indices: Set<Int> = []

var arrayOfMysteryWord = [mysteryWord]
let alphabet: Set<Character> = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

let alphabetArray = Array(alphabet)

 repeat {

    if userInput?.count == 1 {
            
        for (index,char) in arrayOfMysteryWord.enumerated() {

            if userInput == char {
                
                indices.insert(index)
                
                }

        }
            }
            
            
            for (index,_) in .enumerated() {
           
                if  {
                    hiddenWord[index] = userInput ?? ""
                    
                    print((hiddenWord))
                }

            
            }
        
        }
        guessMaximum -= 1
    } while guessMaximum > 0
    
   print()
*/


