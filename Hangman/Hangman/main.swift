//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about"]

var cpuWord = ""
var bodyPartsLeft = 6
var hiddenWord = ""
var guess = true
var updatedWord = ""
var currentWord = ""

//pick random word from array of allTheWords
let lastIndex = allTheWords.count - 1
let firstIndex = 0
let randomIndex = Int.random(in: firstIndex...lastIndex)
let randomWord = allTheWords[randomIndex]
let randomWordArray = randomWord.components(separatedBy: "")
let blankSpace = "_"
//print(randomWord)

//Intro phrases
let greeting = "Welcome to Hangman, where if you do not guess the right word in time...YOU HANG!"
let hangmanPicking = "Wait while the HangMan chooses a word..."
let explanation = "Guess a letter that's in the word till' the word is complete to win, guess wrong \(bodyPartsLeft) times and you're hanged!"

print(greeting + "\n")
print(hangmanPicking + "\n")
print(explanation + "\n")

//
cpuWord = randomWord

//print starting board
for _ in cpuWord {
    hiddenWord += (blankSpace) + " "
}

print(hiddenWord)

print("\n")

let userGuess = String(readLine() ?? "")

//See if can refactor this to use .contains()
func guessOutput(charLetter : String) -> Bool   {
    if cpuWord.contains(charLetter) {
            guess = true
    }
        else {guess = false}
    
    return guess
}
var index = 0
func updateRight(charLetter : String) -> String {
    for char in cpuWord {
        if char == Character(charLetter)    {
            let startIndex = hiddenWord.startIndex
            let offset = hiddenWord.index(startIndex, offsetBy: index)
            hiddenWord.remove(at: offset)
            hiddenWord.insert(Character(charLetter), at: offset)
            updatedWord = hiddenWord
        }
        else    {index += 2}
    }
    return updatedWord
}

func updateWrong() -> String {
    bodyPartsLeft -= 1
    return ""
}

guess = guessOutput(charLetter: userGuess)

if guess == true    {
    currentWord = updateRight(charLetter: userGuess)
    print(currentWord)
    
}
else    {
    print("False")
}

print(cpuWord)
//isLetter
/*
var testStr = "hello"
var startIndex = testStr.startIndex
var offset = testStr.index(startIndex, offsetBy: 2)
testStr.remove(at: offset)
testStr.insert("p", at: offset)
print(testStr)
*/
