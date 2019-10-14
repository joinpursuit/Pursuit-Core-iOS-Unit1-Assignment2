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

Please, type in a letter to get started.

""")

let allTheWords = ["acid", "across", "addition", "adjustment", "advertisement", "beautiful", "because", "before", "behaviour", "belief", "company", "comparison", "competition", "complete", "complex", "cheese", "development", "different", "digestion", "direction", "dirty", "discovery"]

var guessMax = 6

let hangmanHead = ("""

0000000000000
0           0
0           1
0          1 1
0           1
0
0
0
0
0
0
0
0

""")

let hangmanBody = ("""

0000000000000
0           0
0           1
0          1 1
0           1
0           2
0           2
0           2
0
0
0
0
0

""")

let hangmanLeftArm = ("""

0000000000000
0           0
0           1
0          1 1
0           1
0          32
0         3 2
0        3  2
0
0
0
0
0

""")

let hangmanRightArm = ("""

0000000000000
0           0
0           1
0          1 1
0           1
0          324
0         3 2 4
0        3  2  4
0
0
0
0
0

""")

let hangmanLeftLeg = ("""

0000000000000
0           0
0           1
0          1 1
0           1
0          324
0         3 2 4
0        3  2  4
0          5
0         5
0        5
0       5
0

""")

let hangmanRightLeg = ("""

0000000000000
0           0
0           1
0          1 1
0           1
0          324
0         3 2 4
0        3  2  4
0          5 6
0         5   6
0        5     6
0       5       6
0

""")

var randomWord: [Character] = Array(allTheWords.randomElement() ?? "Input a valid response.")
var secretWord: [Character] = Array(repeating: "_" , count: randomWord.count)

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
    let answer1 = readLine()?.lowercased() ?? "a"

    if answer1.count != 1 {
        print("Please enter 1 character at a time")
        continue
    }
    
    let userInput = Character(answer1)
    
    for (index, char) in randomWord.enumerated(){
        if userInput == char {
            indices.insert(index)
        }
    }
    
    for (index, _) in secretWord.enumerated(){
        if indices.contains(index){
            secretWord[index] = userInput
        }
    }
    if secretWord == randomWord {
        print("You win! The word was \(randomWord)")
        print("You had \(guessMax) guesses left.")
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
print("Please enter a character, you have \(guessMax) guesses left.")
        switch true{
        case guessMax == 5:
            print(hangmanHead)
        case guessMax == 4:
            print(hangmanBody)
        case guessMax == 3:
            print(hangmanLeftArm)
        case guessMax == 2:
            print(hangmanRightArm)
        case guessMax == 1:
            print(hangmanLeftLeg)
        default:
            print(hangmanRightLeg)
        }
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


