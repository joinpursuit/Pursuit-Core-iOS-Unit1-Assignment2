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
let alphabet: Array<String> = ["a","b", "c", "d","e", "f", "g" ,"h", "i" , "j", "k","l" ,"m", "n", "o", "p", "q", "r", "s", "t", "u" , "v" , "w", "x", "y", "z" ]
var randomWord = allTheWords.randomElement() ?? "able"
var hiddenWord: Array<Character> = Array(repeating: "_", count: randomWord.count )
var gameState = true
var emptyArr = [Character]()


func resetExit() {
print("Do you want to play again? y/n")
let yesOrNo = readLine()?.lowercased() ?? ""
       switch yesOrNo {
       case "y":
           print("you selected yes")
           randomWord.removeAll()
           randomWord = allTheWords.randomElement() ?? "able"
           hiddenWord.removeAll()
           hiddenWord = Array(repeating: "_", count: randomWord.count )
           chances = 6
           emptyArr.removeAll()
       case "n":
           print("Goodbye")
           exit(20)
       default:
           print("Please enter a y/n")
           resetExit()
       }
}

print("Welcome to Hangman")
sleep(1)

gameLoop: while gameState == true && chances > 0{
    var indices : Set<Int> = []
    print("Enter a character, You have \(chances) guesses")
    let enteredChar = readLine()?.lowercased() ?? ""
    for (index, char) in randomWord.enumerated() {
        if alphabet.contains(enteredChar) {
            if Character(enteredChar) == char {
                indices.insert(index)
        
            }

        }  else {
            print("Enter a letter")
            continue gameLoop
        }
    }
    
    
    if !randomWord.contains(enteredChar) && !emptyArr.contains(Character(enteredChar)) {
        chances -= 1
    }
    
    for (index, _) in hiddenWord.enumerated() {
             if indices.contains(index) {
                 hiddenWord[index] = Character(enteredChar)
             }
    }
    
    if !emptyArr.contains(Character(enteredChar)) {
        emptyArr.append(Character(enteredChar))
    }
       
    
    print("you used \(emptyArr.description)")
         print(String(hiddenWord.description))
     
    if chances == 0 {
        print("you lost")
        resetExit()
    }
    
    if randomWord == String(hiddenWord) {
                print("you win")
        resetExit()
    }
}





