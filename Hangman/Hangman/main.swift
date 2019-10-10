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
print("The RULES are simple: you will see an emplty lines that hiding a word behind them.")
sleep(3)
print("You will have six attempts to guess the entire world by chosing a letter per one attempt.")
sleep(3)
print("Are you ready to play?")
sleep(2)
print("Yes/No")


var yourAnswer = ""

repeat {
    yourAnswer = readLine()?.lowercased() ?? ""
    if yourAnswer == "no" {
        print("No problem. See you next time. Bye!")
        break
    } else if yourAnswer == "yes" {
        print("GREAT!")
    } else {
        print("""
I don't understand your answer. Please type "yes" if you want to play the game, or type "no" if you want exit the game.
""")
    }
} while yourAnswer != "yes"

if yourAnswer == "yes" {
    print("""
LET'S START!
Your word to gues is:
""")
}

let wordsStartingFromA = ["able"]

//    , "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake"]

var randomWord = Array(wordsStartingFromA.randomElement() ?? "animal")

var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)

print(hiddenWord)


var guessMax = 6

var enteredChar: Character//(readLine()?.lowercased() ?? "") // Here is a fatal error

let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")

startloop: repeat {
    print("Enter just 1 character from \"a-z\"")
    print(String(hiddenWord))
    enteredChar = Character(readLine()?.lowercased() ?? "")
    var indices: Set<Int> = []
    
    if !randomWord.contains(enteredChar) {
        guessMax -= 1
        print("The word does not contain such letter. You have \(guessMax) attempt left. Try again.")
        continue startloop
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
            sleep(3)
            print("Do you want to play again?")
            sleep(2)
            print("Yes or No?")
            let continueGame = readLine()?.lowercased() ?? "no"
            
//            if yourAnswer == "no" {
//            print("No problem. See you next time. Bye!")
//            break
                
            if continueGame == "yes" {
                guessMax = 6
                randomWord = Array(wordsStartingFromA.randomElement() ?? "animal")
                hiddenWord = Array(repeating: "_", count: randomWord.count)
                continue startloop
            }
        }
    }
        // print(String(hiddenWord))
    } while guessMax > 0 && randomWord != hiddenWord
print("No problem. See you next time. Bye!")
