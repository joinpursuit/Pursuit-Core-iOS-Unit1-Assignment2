//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

print("Hello!")
sleep(2)
print("This is a HANGMAN GAME.")
sleep(2)
print("The rules are simple: you will see an emplty lines that hiding a word behind them.")
sleep(3)
print("You will have attempts to guess the entire world by chosing a letter per one attempt (up to 6 unseccessful attampts).")
sleep(3)
    print("LET'S START!")

var guessMax = 6

func hangmanArt() {
    if guessMax == 5 {
        print("""
  +---+
  |   |
  O   |
      |
      |
      |
=========
""")
    } else if guessMax == 4 {
        print("""
  +---+
  |   |
  O   |
  |   |
      |
      |
=========
""")
    } else if guessMax == 3 {
        print("""
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========
""")
    } else if guessMax == 2 {
        print("""
  +---+
  |   |
  O   |
 /|\\  |
      |
      |
=========
""")
    } else if guessMax == 1 {
        print("""
  +---+
  |   |
  O   |
 /|\\  |
 /    |
      |
=========''', '''
""")
    } else if guessMax == 0 {
        print("""
GAME OVER!!!
        
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
      |
=========
""")
    }
}

//var yourAnswer = ""
//
//repeat {
//    yourAnswer = readLine()?.lowercased() ?? ""
//    if yourAnswer == "no" {
//        break
//    } else if yourAnswer == "yes" {
//        print("GREAT!")
//    } else {
//        print("""
//I don't understand your answer. Please type "yes" if you want to play the game, or type "no" if you want exit the game.
//""")
//    }
//} while yourAnswer != "yes"



let wordsStartingFromA = ["able"]

//    , "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake"]

var randomWord = Array(wordsStartingFromA.randomElement() ?? "animal")

var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)

//print(hiddenWord)


var enteredChar: Character//(readLine()?.lowercased() ?? "") // Here is a fatal error

let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")

func resetGame() {
    print("reseting game.....")
    guessMax = 6
    randomWord = Array(wordsStartingFromA.randomElement() ?? "animal")
    hiddenWord = Array(repeating: "_", count: randomWord.count)
}

repeat {
    print("Your word to guess is:")
    print(hiddenWord)
    print("Enter just 1 character from \"a-z\"")
    print(String(hiddenWord)) // "hi" is not a character app will crash
    let userInput = readLine()?.lowercased() ?? ""
    if userInput.count != 1 {
        print("Please enter ONLY 1 character")
        continue
    }
    enteredChar = Character(userInput)
    var indices: Set<Int> = []
    
    if !randomWord.contains(enteredChar) {
        guessMax -= 1
        hangmanArt()
        print("""
The word does not contain such letter.
You have \(guessMax) attempt left.
""")
        
        if guessMax == 0 {
            print("you lost")
            print("Do you want to play again?, yes or no")
            let response = readLine() ?? ""
            if response == "yes" {
                // reset all variable to default values
                resetGame()
            }
        }
        
        continue
    }
    
    for (index, char) in randomWord.enumerated() {
        if enteredChar == char {
            indices.insert(index)
        }
    }
    
    for (index, _) in hiddenWord.enumerated() {
        if indices.contains(index) {
            hiddenWord[index] = enteredChar
        }
        if !hiddenWord.contains("_") {
            print("CONGRATULATIONS!!! You win!")
            print("The hidden word was \(hiddenWord)")
            sleep(2)
            print("Do you want to play again?")
            print("Yes or No?")
        
            let continueGame = readLine()?.lowercased() ?? "no"
            
            if continueGame == "yes" {
                resetGame()
                continue
            }
        }
    }
    
    // print(String(hiddenWord))
} while guessMax >= 1 && randomWord != hiddenWord

 print("Goodbye! See you next time!")

//print("""
//(Do you want to play again?
//Yes or No?)
//""")
//
//yourAnswer = readLine()?.lowercased() ?? ""
//
//if yourAnswer == "yes" {
//    continue startloop
//} else if yourAnswer == "no" {
//    print("Goodbye!")
//} else {
//    print("""
//I did not understood your answer.
//Please type \"Yes\" if you want continue the game
//        OR
//\"No\" if you want exit the game.
//""")
//}
// 


