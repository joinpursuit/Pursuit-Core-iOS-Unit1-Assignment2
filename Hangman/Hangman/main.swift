//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["hellool"]

var enteredLetters : [String] = []
var remains = ""

var cpuWord = "", hiddenWord = "", updatedWord = "", currentWord = ""
var bodyPartsLeft = 6, index = 0, updatedBodyParts = 6
var guess = true, entered = false, guessedRight = true, gameOver = false

let lastIndex = allTheWords.count - 1, firstIndex = 0
let randomIndex = Int.random(in: firstIndex...lastIndex)
let randomWord = allTheWords[randomIndex]
let randomWordArray = randomWord.components(separatedBy: "")
let blankSpace = "_"

var alphabet = "a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z"
var currentAlphabet = ""

//Intro phrases
let greeting = "Welcome to Hangman, where if you do not guess the right word in time...YOU HANG!"
let hangmanPicking = "Wait while the HangMan chooses a word..."
let explanation = "Guess a letter that's in the word till' the word is complete to win, guess wrong \(bodyPartsLeft) times and you're hanged!"
var chancesLeftScript = "You have \(bodyPartsLeft) body parts left"

cpuWord = randomWord

//See if can refactor this to use .contains()
func guessOutput(enteredLetter : String) -> Bool   {
    if cpuWord.contains(enteredLetter) {
            guess = true
    }
        else {guess = false}
    
    return guess
}

func updateRight(enteredLetter : String) -> String {
    for char in cpuWord {
        if char == Character(enteredLetter)    {
            let startIndex = hiddenWord.startIndex
            let offset = hiddenWord.index(startIndex, offsetBy: index)
            hiddenWord.remove(at: offset)
            hiddenWord.insert(Character(enteredLetter), at: offset)
            updatedWord = hiddenWord
            index += 2
        }
        else    {index += 2}
    }
    index = 0
    return updatedWord
}

func updateWrong() -> String {
    updatedWord = hiddenWord
    return updatedWord
}

func enteredLetterBucket(enteredLetter : String) -> [String]   {
    enteredLetters.append(enteredLetter)
    let noDuplicates = Set(enteredLetters)
    enteredLetters = Array(noDuplicates).sorted()
    return enteredLetters
}

func checkAlreadyEntered(enteredLettersArray : [String], enteredLetter : String) -> Bool  {
    if enteredLettersArray.contains(enteredLetter)  {
        entered = true
    }
    else    {entered = false}
    return entered
}

func remainingAlphabet(enteredLetter : String, alph : String) -> String    {
    if alph.contains(enteredLetter) {
        currentAlphabet = alph.replacingOccurrences(of: enteredLetter, with: " ")
    }
    return currentAlphabet //string, contains, removeoccurrences
}

func checkWordComplete(checkWord : String, soFarWord : String) -> Bool    {
    var count = 0
    var complete = false
    for char in checkWord {
        if soFarWord.contains(char)   {
            count += 1
        }
    }
    if count == checkWord.count {
        complete = true
    }
    else {complete = false}
    return complete
}

func updateBodyParts(guess : Bool) -> Int  {
    if guess == false   {
        updatedBodyParts -= 1
    }
    return updatedBodyParts
}

print(greeting + "\n")
print(hangmanPicking + "\n")
print(explanation + "\n")

//print starting board
for _ in cpuWord {
    hiddenWord += (blankSpace) + " "
}

print(hiddenWord + "\n")
print("\n" + alphabet)


//start loop after intro print for single game
//loop whole thing for play again

repeat  {
let userGuess = String(readLine() ?? "")
guess = guessOutput(enteredLetter: userGuess)

//var remainingLetters = remainingAlphabet(enteredLetter: userGuess) //move adjust

    let alreadyEntered = checkAlreadyEntered(enteredLettersArray: enteredLetters, enteredLetter: userGuess) //check print

bodyPartsLeft = updateBodyParts(guess: guess)
    
if alreadyEntered == true   {
    print("Already entered letter")
    print("\n" + currentWord + "\n")
    print("You have \(bodyPartsLeft) body parts left")
    print("Used Letters: \(enteredLetters)")
    alphabet = remainingAlphabet(enteredLetter: userGuess, alph: alphabet)
    print("Remaining Letters: \(alphabet)\n")
}

else if guess == guessedRight    {
    currentWord = updateRight(enteredLetter: userGuess)
    enteredLetters = enteredLetterBucket(enteredLetter: userGuess)
    print("\n" + currentWord + "\n")
    print("You have \(bodyPartsLeft) body parts left")
    print("Used Letters: \(enteredLetters)")
    alphabet = remainingAlphabet(enteredLetter: userGuess, alph: alphabet)
    print("Remaining Letters: \(alphabet)\n")
    if checkWordComplete(checkWord: cpuWord, soFarWord: currentWord) == true    {
        print("You Win!")
        gameOver = true
    }
    //store used alphabet letters
    //print remaining alphabet
    //check if word completed or out of chances to end game
}
    
else    {
    currentWord = updateWrong()
    enteredLetters = enteredLetterBucket(enteredLetter: userGuess)
    print("\n" + currentWord + "\n")
    print("You have \(bodyPartsLeft) body parts left")
    print("Used Letters: \(enteredLetters)")
    alphabet = remainingAlphabet(enteredLetter: userGuess, alph: alphabet)
    print("Remaining Letters: \(alphabet)\n")
    print("Remaining Letters: \(remains)\n")
    if bodyPartsLeft == 0   {
        print("You Lose")
        gameOver = true
    }
}
}  while gameOver == false
//print(cpuWord)
//isLetter
/*
var testStr = "hello"
var startIndex = testStr.startIndex
var offset = testStr.index(startIndex, offsetBy: 2)
testStr.remove(at: offset)
testStr.insert("p", at: offset)
print(testStr)
*/
//optionals
