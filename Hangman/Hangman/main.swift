//
//  main.swift
//  Hangman
//
//  Created by Jian Ting Li on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var restart = true

while restart {
    
    print("Enter your name:\n")
    let playerName = readLine()

    print("\nLet's play some Hangman, \(playerName!).\n")
    sleep(1)

    print("Generating word.....\n")
    sleep(1)

    var computerWord = ""
    let validWord = false

    while !validWord {
        if let randomWord = allTheWords.randomElement()?.uppercased() {
            computerWord = randomWord
            break
        }
    }

    print("Word Generated 😃\n")


    let computerWordArr = Array(computerWord)
    var guessedLetters = [String]()
    var wordBlanks = [String]()

    for _ in computerWordArr {
        wordBlanks.append("_")
    }
    
    var guessNum = 0
    var lettersLeft = computerWord.count     // before the player wins
    var chances = 6                          // before the player loses

    print(computerWordArr)
    print(computerWord)
    let game = true

    while game {
        sleep(1)
        guessedLetters.sort()
        let hangmanPics: [String] = [
            """
            _______
              |    |
              |<-😵--      ~STRIKE!!!~
              |     /
              |    /|      GAME OVER 😭!
              |     |_
             _|_     \\
            |   |______
            |          |
            |__________|

        """
            ,
            """
            _______
              |    |
              |    O       Chances:    \(chances)
              |   /|\\
              |    |       Guessed:  \(guessedLetters.joined(separator: " "))
              |   /
             _|_
            |   |______
            |          |
            |__________|
            
            """
            ,
            """
            _______
              |    |
              |    O       Chances:    \(chances)
              |   /|\\
              |    |       Guessed:  \(guessedLetters.joined(separator: " "))
              |
             _|_
            |   |______
            |          |
            |__________|
            
            """
            ,
            """
            _______
              |    |
              |    O       Chances:    \(chances)
              |    |\\
              |    |       Guessed:  \(guessedLetters.joined(separator: " "))
              |
             _|_
            |   |______
            |          |
            |__________|
            
            """
            ,
            """
            _______
              |    |
              |    O       Chances:    \(chances)
              |    |
              |    |       Guessed:  \(guessedLetters.joined(separator: " "))
              |
             _|_
            |   |______
            |          |
            |__________|
            
            """
            ,
            """
            _______
              |    |
              |    O       Chances:    \(chances)
              |
              |            Guessed:  \(guessedLetters.joined(separator: " "))
              |
             _|_
            |   |______
            |          |
            |__________|
            
            """
            ,
            """
            _______
              |    |
              |            Chances:    \(chances)
              |
              |            Guessed:  \(guessedLetters.joined(separator: " "))
              |
             _|_
            |   |______
            |          |
            |__________|
            
            """
        ]
        
        print(hangmanPics[chances])
        print(wordBlanks.joined(separator: " "))
        
        //games ends when either: 1) player has guessed all the letters     2) player has no more chances
        guard chances > 0 && lettersLeft > 0 else {break}
        
        print("\nPlease enter a \"letter\": \n")
        let userInput = readLine()
        
        if let userInput = userInput {
            let input = userInput.uppercased()
            
            guard alphabets.contains(input) else {
                print("\nThat's not a letter.\"")
                continue
            }
            
            guard !guessedLetters.contains(input) else {
                print("\nYou already enter \(input).")
                continue
            }
            
            guard input.count == 1 else {
                print("Please enter \"1\" letter only.")
                continue
            }
            
            guessedLetters.append(input)
            guessNum += 1
            
            if !computerWord.contains(input) {
                print("\nThe word doesn't contain \"\(input)\", please try again.\n")
                chances -= 1
                continue
            }
            
            for (index, letter) in computerWordArr.enumerated() {
                if input == String(letter) {
                    wordBlanks[index] = String(letter)
                    lettersLeft -= 1
                }
            }
            print("HooRay!!, the word contains a \"\(input)\" 💃🕺🏻.\n")
            
        } else {
            print("\nInvalid Input")
        }
    }
    
    //win / lose ending
    if lettersLeft == 0 {
        print("You Win the GAME!!! 👏")
        sleep(1)
        print("It takes you \"\(guessNum)\" guesses to figure out the word 😎." )
    } else {
        print("The word is \"\(computerWord).\" \nBetter luck next time 😉.")
    }
    
    //ask user to restart the game
   
    let invalidResponse = true
    while invalidResponse {
        sleep(1)
        print("Do you want to play again?")
        if let response = readLine()?.lowercased() {
            print("")
            if response == "yes" {
                print("Restarting...⌨️")
                sleep(1)
                break
            } else if response == "no" {
                print("Thank you for playing 🙂. GoodBye ✋.")
                restart = false
                break
            } else {
                print("Is that a \"Yes\" or \"No\"?")
            }
        }
    }
    
}




//The user must be able to play against the computer  ✔️

//The word that the computer chooses must be random. There is a large array of words below. ✔️

//The user must have a limited number of guesses ✔️

//After each guess, the computer should print out the current state of the word you are guessing. (ex. A _ _ L E, for apple) ✔️

//After each guess the computer should print out how many guesses you have remaining. For full credit, make it actually print out a picture somewhat similar to the link above. ✔️

//The computer should tell the user if she wins, show her how many guesses it took and end the current game. ✔️

//The user should see the correct answer if she loses. ✔️

//The user should have the option to play the game again. ✔️

