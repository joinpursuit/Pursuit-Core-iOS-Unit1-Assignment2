//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let hangmanWords = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua","Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","BosniaHerzegovina","Botswana","Brazil","BritishVirginIslands","Brunei","Bulgaria","BurkinaFaso","Burundi","Cambodia","Cameroon","CapeVerde","CaymanIslands","Chad","Chile","China","Colombia","Congo","CookIslands","CostaRica","CoteDIvoire","Croatia","Cuba","Cyprus","CzechRepublic","Denmark","Djibouti","Dominica","DominicanRepublic","Ecuador","Egypt","ElSalvador","EquatorialGuinea","Estonia","Ethiopia","FalklandIslands","FaroeIslands","Fiji","Finland","France","FrenchPolynesia","FrenchWestIndies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","GuineaBissau","Guyana","Haiti","Honduras","HongKong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","IsleofMan","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","KyrgyzRepublic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","NetherlandsAntilles","NewCaledonia","NewZealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","PapuaNewGuinea","Paraguay","Peru","Philippines","Poland","Portugal","PuertoRico","Qatar","Reunion","Romania","Russia","Rwanda","SaintPierreamp","Miquelon","Samoa","SanMarino","Satellite","SaudiArabia","Senegal","Serbia","Seychelles","SierraLeone","Singapore","Slovakia","Slovenia","SouthAfrica","SouthKorea","Spain","SriLanka","StKittsNevis","StLucia","StVincent","StLucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","TimorLEste","Togo","Tonga","TrinidadTobago","Tunisia","Turkey","Turkmenistan","TurksCaicos","Uganda","Ukraine","UnitedArabEmirates","UnitedKingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","VirginIslands","Yemen","Zambia","Zimbabwe"]

let chance1 = """
+---+
|   |
O   |
|
|
=====
"""
let chance2 = """
 +---+
 |   |
 O   |
 ||  |
 |   |
     |
 =========
"""
let chance3 = """
 +---+
 |   |
 O   |
|||  |
 |   |
     |
=========
"""
let chance4 = """
+---+
 |   |
 O   |
|||  |
 |   |
|    |
=========
"""
let chance5 = """
+---+
 |   |
 O   |
|||  |
 |   |
| |  |
=========
"""
let chance6 = """
+---+
 |   |
 X   |
|||  |
 |   |
| |  |
=========
"""



print("Welcome to the game of hangman (countries edition). This game will test the knowledge you have for the countries around the world 🌍.")
print()
//sleep(1)
print("You will have a total of 6 chances to guess the word that was randomly selected inorder to beat the game. Once you have used your 6th chance the game is end. So guess your words wisely.")
print()
//sleep(1)
print("""

888               888                   888888b.                     🌍🌍
888               888                   888  "88b                    🌍🌍
888               888                   888  .88P
888       .d88b.  888888 .d8888b        8888888K.   .d88b.   .d88b.  888 88888b.
888      d8P🌍Y8b 888    88K            888  "Y88b d8P🌍Y8b d88P"88b 888 888 "88b
888      88888888 888    "Y8888b.       888    888 88888888 888🌍888 888 888  888
888      Y8b.     Y88b.       X88       888   d88P Y8b.     Y88b 888 888 888  888
88888888  "Y8888   "Y888  88888P'       8888888P"   "Y8888   "Y88888 888 888  888
                                                                 888
                                                            Y8b d88P
                                                             "Y88P"
""")
print()
//sleep(1)
print("If you are ready to take on the challenge type \"ready\" to begin the game.")
//sleep(1)

let startGame = "ready"
var userStart = readLine()?.lowercased().trimmingCharacters(in: .whitespaces)

repeat {
    if userStart == startGame {
        print()
        print("Welcome to the game, glhf(good luck have fun)")
    }
    else {
        print()
        print("Please play the game. Its kinda fun")
        userStart = readLine()
    }
} while userStart != startGame

print()
//sleep(1)

print("Thank you for starting the game.")

//sleep(1)

var userGuessLetter = ""
var repeatedInput = [String]()
var userTries = 0
var chosenWord = "".lowercased()
var alphabets = "abcdefghijklmnopqrstuvwxyz"


if let randomWords = hangmanWords.randomElement() {
    chosenWord = randomWords
}
var arrayDashes = [Character]()

for _ in chosenWord {
    arrayDashes.append("_")
}
var chosenWordsArray = Array(chosenWord)

print()

print("Guess the word above by typing your letters.")

var condition = true

validloop: repeat {
    print(String(arrayDashes))
    let userGuess = readLine() ?? "d"
    
    userGuessLetter = userGuess
    
    if alphabets.contains(String(userGuessLetter.lowercased())){
        
        if userGuessLetter.count == 1 {
            if chosenWord.contains(userGuess) {
                for (index, char) in chosenWordsArray.enumerated() {
                    if String(char) == userGuess {
                        arrayDashes[index] = Character(userGuess)
                    }
                }
                print()
                print("right")
            } else {
                userTries += 1
                print()
                print("wrong you have \(6-userTries) chances left.")
                if userTries == 6 {
                    print()
                    print("Sorry you failed. The word was \(chosenWord)")
                    condition = false
                }
                
                switch userTries {
                case 1:
                    print(chance1)
                case 2:
                    print(chance2)
                case 3:
                    print(chance3)
                case 4:
                    print(chance4)
                case 5:
                    print(chance5)
                case 6:
                    print(chance6)
                default:
                    print("where is my man?")
                }
                
            }
        }
        
    } else {
        print("not a valid character")
        
    }
    
    
} while condition

































