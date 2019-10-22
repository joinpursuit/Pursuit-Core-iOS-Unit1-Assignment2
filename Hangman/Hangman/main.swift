//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//============================================================
//                       Game Start
//============================================================

print("Would you like to play Hangman? Y/N")
var gameStart = readLine()?.uppercased()


var playerGuess: Character
let allTheWords = ["help", "berry", "news", "guest"]
var word: [Character] = Array(allTheWords.randomElement() ?? " ")
var blankWord = " "
let totalChances = 6
var remainingChances = 6
var usedChances = 0
var hiddenWord: [Character] = Array(repeating: "_", count: word.count)
var letterCheck = ["abcdefghijklmnopqrstuvwxyz"]
var usedLetters = [Character]()
let wordArr = [word]

repeat{
    print(wordArr)
    var hiddenWordIndex = [Int]() // [1, 2]
    
        print(" ")
        print("""
            There are \(word.count) letters.
            You have \(remainingChances) remaining guesses.
            You have used \(usedChances) guesses.
            """)
        playerGuess = Character(readLine() ?? "")
    
    // find indices of the entered character
    for (index, char) in word.enumerated() {
        if playerGuess == char {
            hiddenWordIndex.append(index)
        }
    }
    
    for (index, _) in hiddenWord.enumerated() {
        if hiddenWordIndex.contains(index) {
            hiddenWord[index] = playerGuess // _ _ _ _ _  => _ p p _ _
        }
    }
    
    print(String(hiddenWord))
      
    if playerGuess != nil {
        remainingChances -= 1
        usedChances += 1
        if remainingChances == 0 {
            //   NEED TO FIX remainingChoices = reset back to 6
            remainingChances == 6
            usedChances == 0
            print("Would you like to play Hangman? Y/N")
            gameStart = readLine()?.uppercased()
        }
    }
    
} while gameStart == "Y"
