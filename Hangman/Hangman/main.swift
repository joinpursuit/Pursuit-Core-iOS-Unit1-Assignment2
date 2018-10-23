//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
////If let userRespond = readLine() {
//Print(userAge) //‘30'
//If let userAge = Int(userrespund)  {
//    If userAge >= 21 [
//        Print(“drink")
//}

import Foundation



let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
var guessCount1 = """
  ________
   |/   |
   |    🙄
   |
   |
   |
__________
"""
var guessCount2 = """
________
|/   |
|   😟
|    |
|
|
__________
"""
var guessCount3 = """
________
|/   |
|    ☹️
|    |\\
|
|
__________
"""
var guessCount4 = """
________
|/   |
|   😩
|   /|\\
|
|
__________
"""
var guessCount5 = """
________
|/   |
|   😱
|   /|\\
|     \\
|
__________
"""
var guessCount6 = """
________☠️ ☠️
|/  |      ☠️☠️
|    💀   ☠️
|   /|\\    ☠️☠️
|   / \\  ☠️
|          ☠️ ☠️
☠️☠️☠️☠️☠️☠️
"""


var playGame = ""



    

    let choesenWord = allTheWords.randomElement()!
    let guessLimit = 6
    var guessCount = 0
    var userInputs = [Character]()
    var outputLine = ""
    var guessInput = ""
    var chosenWordLettersArray = [Character]()
   //print(choesenWord)
    for letter in choesenWord {
        if chosenWordLettersArray.contains(letter) != true {
            chosenWordLettersArray.append(letter)
        }
    }
    let lowercaseAlphabet = "abcdefghijklmnopqrstuvwxyz"
    let alphabetArray = Array(lowercaseAlphabet)
    print("Let's play Hangman! You will have \(guessLimit) chances to guess the correct letters")

    while guessCount < guessLimit {
        print("Guess a letter. Type your guess (in lowercase) into the console.")
        guessInput = readLine()!
      
        
        if userInputs.contains(Character(guessInput)) == true {
            print("You already chose that character! Guess another letter.")
        } else if alphabetArray.contains(Character(guessInput)) != true {
            print("That is not a valid guess.")
        } else {
            if chosenWordLettersArray.contains(Character(guessInput)) {
                print("\(guessInput) is in the secret word!")
                let characterIndex = chosenWordLettersArray.firstIndex(of: Character(guessInput))
                chosenWordLettersArray.remove(at: characterIndex!)
 
                
                if chosenWordLettersArray.count == 0 {
                    if guessCount == 0 {
                        print("You've guessed all the letters correctly with \(guessCount) wrong guesses!")
                    } else if guessCount == 1 {
                        print("You've guessed all the letters correctly with only \(guessCount) wrong guess!")
                    } else {
                        print("You've guessed all the letters correctly with only \(guessCount) wrong guesses!")
                    }
                    print("The word is \(choesenWord)")
                    break
                }
            } else {
                print("\(guessInput) is not in the secret word!")
                guessCount = guessCount + 1
                
                if guessCount == 1{
                    print(guessCount1)
                }
                if guessCount == 2 {
                    print(guessCount2)
                }
                if guessCount == 3 {
                    print(guessCount3)
                }
                if guessCount == 4{
                    print(guessCount4)
                }
                if guessCount == 5 {
                    print(guessCount5)
                }
                if guessCount == 6 {
                    print(guessCount6)
                }
            }
            
            userInputs.append(Character(guessInput))
            outputLine = ""
            for letter in choesenWord {
                if userInputs.contains(letter) {
                    outputLine = outputLine + String(letter)
                } else {
                    outputLine = outputLine + "_"
                }
                outputLine = outputLine + " "
            }

            print("Here is what you have so far: \(outputLine)")

            print("These are the letters you've guessed so far: \(userInputs)")

            print("You have \(guessLimit-guessCount) guesses left")
            if guessLimit - guessCount == 0 {
                print(" ")
                
                
                print("""
                    ✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘
                    
                      Game over. You used up all of your guesses. The secret word was \(choesenWord)
                    
                    ✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘✹✘
                    """)
                
                
                print(" ")
            }
        }
    }

    print("Would you like to play again? Type 'yes' or 'no'")
    playGame = readLine()!
    
    while playGame != "yes" && playGame != "no" {
        print("I'm sorry, I didn't understand your input. Would you like to play again? Type 'yes' or 'no'")
        playGame = readLine()!
    }
    
    if playGame == "no" {
        print("Okay, thank you for playing!")
    }


