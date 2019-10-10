//
//  main.swift
//  Adam's Hangman
//
//  Created by Adam Diaz on 10/8/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation


print("HangMAN")

// finish the game within a repeat-while loop
// if line
// counter
// bool for repeat game(true/false)
// start easy dont start hard

sleep(2)

print("Press \"Enter\" to continue")

let _ = readLine()

sleep(2)

var numberOfChances = 6

var counter = 0

// decrement to 0

//print(randomWord as Any)
// inputs have to be empty initially
// the computer decides,

// i need a switch statement that tells me how many strikes i have left

// array


//
//  main.swift
//  project practice
//
//  Created by Adam Diaz on 10/10/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation


print("Hangmaniana")

var bool = true

sleep(2)

let words = ["apple"]//[ "able", "about", "account", "acid", "across", "addition","balance", "ball", "band", "base", "basin", "basket","conscious", "control", "cook", "copper", "copy", "cord","discussion", "disease", "disgust", "distance", "distribution","effect", "elastic", "electric", "engine", "enough","frequent", "friend", "from", "front", "fruit","goat", "gold", "good", "government", "grain","hearing", "heart", "heat", "help", "high", "history","insurance", "interest", "invention", "iron", "island","jewel", "join", "journey", "judge", "jump", "kind", "kiss", "knee", "knife", "knot", "letter", "level", "library", "lift", "light","mass", "match", "material", "meal", "measure", "natural", "near", "necessary", "neck", "need", "ornament", "other", "oven", "over", "owner","paste", "payment", "peace", "pencil", "person","quality", "question", "quick", "quiet", "quite","reason", "receipt", "record", "regret", "regular","safe", "sail", "salt", "same", "sand", "table", "tail", "take", "talk", "tall", "taste", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash","year", "yellow", "yesterday", "young", "xylophone", "zion" ]

let alph: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")

var randomWord: [Character] = Array(words.randomElement() ?? "error")

var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)

print("enter a character", hiddenWord)

var userInput = Character(readLine()?.lowercased() ?? "Error")

var indices = Set<Int>()

repeat {
for (index, char) in randomWord.enumerated() {
    if userInput == char {
        indices.insert(index)
    }
}

for (index, _) in hiddenWord.enumerated() {
    
    if indices.contains(index) {
        hiddenWord[index] = userInput
        
    }
}

print(String(hiddenWord))
} while bool == false


