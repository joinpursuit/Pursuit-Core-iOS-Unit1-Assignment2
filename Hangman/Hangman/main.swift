//
//  main.swift
//  HANGMAN-TEST
//
//  Created by Jaheed Haynes on 10/10/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation


var allTheWords = ["able", "about", "account"]

//Alphabet library
let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")

//Numbers array ** to protect against number entry**
var Numbers = [1234567890]

var randomWord = allTheWords.randomElement() ?? "nope" //door
var hiddenWord = ("")
var arrayWord = [Character]()
var attemptsCount = 6
var indeces = [Int]()

for _ in randomWord {
    hiddenWord += "_"
    arrayWord.append("_")
}
var repeatCon = true
var wrongAnswer = 0
var wrongTry = 6

//============================================================================================================================

print("Welcome to Hangman")
print()
print("Type One Letter & Try to solve")
print()

func hangmanArt() {
    if wrongTry == 6 {
    print( """
    |------
    |/    |
    |
    |
    |
    =========
    """)
    } else if wrongTry == 5 {
    print( """
    |------
    |/    |
    |     0
    |
    |
    =========
    """)
    } else if wrongTry == 4 {
   print( """
    |------
    |/    |
    |     0
    |     |
    |
    =========
    """)
    }else if wrongTry == 3 {
    print( """
    |------
    |/    |
    |     0
    |    /|
    |
    =========
    """)
    } else if wrongTry == 2 {
    print( """
    |------
    |/    |
    |     0
    |    /|\\
    |
    =========
    """)
    } else if wrongTry == 1 {
        print("""
    |------
    |/    |
    |     0
    |    /|\\
    |    /
    =========
    """)
    } else if wrongTry == 0 {
        print("""
    |------
    |/    |
    |     0
    |    /|\\
    |    / \\
    =========
    """)
    }
}   // Function with Hangman Ascii Art

loop: repeat {
    for char in arrayWord {
        print(char, terminator: " ")
    }
    print()
    let userInput = Character(readLine()?.lowercased() ?? "a")
    if randomWord.contains(userInput) {
        for (index,char) in randomWord.enumerated() {
            if char == userInput {
                arrayWord[index] = char
                print("GOOD JOB 🥳")
            }
        }
    } else {
        print("you entered \(userInput) try again")
        wrongTry -= 1
        print("You have \(wrongTry) guesses left, Try again 🤷🏽‍♂️")
        if wrongTry == wrongAnswer {
            repeatCon = false
            hangmanArt()
            break
        }
    }
     hangmanArt()
    print(hiddenWord)
} while repeatCon
print("You Lose")


