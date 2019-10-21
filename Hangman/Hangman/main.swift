//
//  main.swift
//  Adam's Hangman
//
//  Created by Adam Diaz on 10/8/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

print("Hangmaniana")

// finish the game within a repeat-while loop
// if line
// counter
// bool for repeat game(true/false)
// start easy dont start hard


print("Press \"Enter\" to continue")

let _ = readLine()

sleep(2)



// decrement to 0

//print(randomWord as Any)
// inputs have to be empty initially
// the computer decides,

// i need a switch statement that tells me how many strikes i have left

// array

//var bool = true

let words = [ "able", "about", "account", "acid", "across", "addition","balance", "ball", "band", "base", "basin", "basket","conscious", "control", "cook", "copper", "copy", "cord","discussion", "disease", "disgust", "distance", "distribution","effect", "elastic", "electric", "engine", "enough","frequent", "friend", "from", "front", "fruit","goat", "gold", "good", "government", "grain","hearing", "heart", "heat", "help", "high", "history","insurance", "interest", "invention", "iron", "island","jewel", "join", "journey", "judge", "jump", "kind", "kiss", "knee", "knife", "knot", "letter", "level", "library", "lift", "light","mass", "match", "material", "meal", "measure", "natural", "near", "necessary", "neck", "need", "ornament", "other", "oven", "over", "owner","paste", "payment", "peace", "pencil", "person","quality", "question", "quick", "quiet", "quite","reason", "receipt", "record", "regret", "regular","safe", "sail", "salt", "same", "sand", "table", "tail", "take", "talk", "tall", "taste", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash","year", "yellow", "yesterday", "young", "xylophone", "zion" ]

var chances = 6

let alph: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")

var randomWord: [Character] = Array(words.randomElement() ?? "error")

var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)

var wrongGuesses: [Character] = Array(repeating: "_", count: randomWord.count)

//print(randomWord)

let original = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜
⎜
⎜
⎜
⎜
⎣________

"""
print(original)

let guess1: String = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜             🥺
⎜
⎜
⎜
⎜
⎣________


"""

let guess2: String = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜             🥺
⎜              ⎜
⎜              ⎜
⎜
⎜
⎣________


"""

let guess3: String = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜             🥺
⎜           ✌🏽 ⎜
⎜              ⎜
⎜
⎜
⎣________


"""

let guess4: String = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜             🥺
⎜           ✌🏽 ⎜ ✋🏽
⎜              ⎜
⎜
⎜
⎣________


"""

let guess5: String = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜             🥺
⎜           ✌🏽 ⎜ ✋🏽
⎜              ⎜
⎜            👞
⎜
⎣________


"""

let guess6: String = """

⎡‾‾‾‾‾‾‾‾‾‾‾‾‾‾⎫
⎜             😵
⎜           👋🏽 ⎜👋🏽
⎜              ⎜
⎜            👞 👞
⎜
⎣________


"""

print("enter a character", hiddenWord)


var indices = Set<Int>()


while chances != 0  {

let userInput = readLine() ?? "a"
        
for (index, char) in randomWord.enumerated() {
    if userInput == String(char) {
        indices.insert(index)
        
    }
}

for (index, _) in hiddenWord.enumerated() {
    if indices.contains(index) {
        hiddenWord[index] = Character(userInput)
        indices.remove(index)
//        indices.remove(at: index)
//        print("here 1")
        
    } else {
        for (index, char) in randomWord.enumerated() {
            if userInput != String(char) {
                wrongGuesses[index] = char
//                print("here")
            }
        
        }
        
    }
    
}

if !randomWord.contains(Character(userInput)) {
    print("Wrong letters \(userInput)")
    chances -= 1
    
    switch chances {
     case 0:
         print("hes DEAD \(guess6)")
     case 1:
         print("\(guess5) one more")
     case 2:
         print("\(guess4) two more")
     case 3:
         print("\(guess3) three more")
     case 4:
         print("\(guess2) four more")
     case 5:
         print("\(guess1) five more")
     default:
         print(original)
     }
     
} else {
    
    print("Keep going! \(original) \(String(hiddenWord))")
    
}


}

