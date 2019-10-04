//
//  main.swift
//  Hangman
//
//  Created by Bienbenido Angeles on 10/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
//array of words to choose
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against"]

//AI chooses words from an array of strings
let allTheWordsStartIndex = allTheWords.startIndex
let allTheWordsEndIndex = allTheWords.endIndex - 1
let computerChoice = Int.random(in: allTheWordsStartIndex...allTheWordsEndIndex)
let computerChoiceOfWord = allTheWords[computerChoice]

print(computerChoiceOfWord)
