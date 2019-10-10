//
//  main.swift
//  Adam's Hangman
//
//  Created by Adam Diaz on 10/8/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

print("HangMAN")

var numberOfGuesses = 0

var guesses : [Character] = []

let allTheWords = [ "able", "about", "account", "acid", "across", "addition","balance", "ball", "band", "base", "basin", "basket","conscious", "control", "cook", "copper", "copy", "cord","discussion", "disease", "disgust", "distance", "distribution","effect", "elastic", "electric", "engine", "enough","frequent", "friend", "from", "front", "fruit","goat", "gold", "good", "government", "grain","hearing", "heart", "heat", "help", "high", "history","insurance", "interest", "invention", "iron", "island","jewel", "join", "journey", "judge", "jump", "kind", "kiss", "knee", "knife", "knot", "letter", "level", "library", "lift", "light","mass", "match", "material", "meal", "measure", "natural", "near", "necessary", "neck", "need", "ornament", "other", "oven", "over", "owner","paste", "payment", "peace", "pencil", "person","quality", "question", "quick", "quiet", "quite","reason", "receipt", "record", "regret", "regular","safe", "sail", "salt", "same", "sand", "table", "tail", "take", "talk", "tall", "taste", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash","year", "yellow", "yesterday", "young", "xylophone", "zion" ]

let randomWord = allTheWords.randomElement()

//print(randomWord as Any)

var char = ""

char = readLine() ?? "error"


