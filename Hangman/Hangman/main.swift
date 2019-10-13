//
//  main.swift
//  testing Hangman
//
//  Created by Gregory Keeley on 10/9/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

let hangManFinal = """
|------
|/    |
| \u{205F}\u{2009} 😵
|    /|\\
|    /\u{203E}\\
=========
"""

let hangManEmpty = """
|------
|/    |
|
|
|
=========

6 guesses remaining

"""

let hangMan1 = """
|------
|/    |
|     0
|
|
=========

5 guesses remaining

"""

let hangMan2 = """
|------
|/    |
|     0
|     |
|
=========

4 guesses remaining

"""
let hangMan3 = """
|------
|/    |
|     0
|    /|
|
=========

3 guesses remaining

"""
let hangMan4 = """
|------
|/    |
|     0
|    /|\\
|
=========

2 guesses remaining

"""
let hangMan5 = """
|------
|/    |
|     0
|    /|\\
|    /
=========

1 guess remaining

"""


//============================================================================================================

let words = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
var randomWord = words.randomElement()?.lowercased() ?? "ERROR" // Pulls a random word from the array
var underscoresFromRandomWord:[Character] = Array(String(repeating: "_", count: randomWord.count)) // Turns the random word into underscores in an array
var hiddenWord = String(underscoresFromRandomWord) // turns the array of underscores into a string, for the player to see
var maxGuesses = 5 // Sets the maximum amount of guesses to 6
var guessCounter = 0 // Starts a counter for how many attempts the player has made
var lettersGuessed = "" // Starts a blank string(Should this be an array?) to keep track of the letters guessed
var repeatCondition = true // Set the while loop
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var indices = [Int]()
var correctGuess = ""
var winWord = ""
func resetGame() -> () {
    randomWord = words.randomElement()?.lowercased() ?? "ERROR"
    underscoresFromRandomWord = Array(String(repeating: "_", count: randomWord.count))
    hiddenWord = String(underscoresFromRandomWord)
    lettersGuessed = ""
    guessCounter = 0
    repeatCondition = true
}

print("Give it a shot, guess letter")
print()
print("Cheat: \(randomWord)") // dont forget to take out
print()
print(hangManEmpty)





repeat {
    print(hiddenWord)
    if randomWord == (String(underscoresFromRandomWord)) {
        print("You have managed to guess the word correctly and save the man from hanging!")
        sleep(1)
        print("Would you like to play again?")
        let losePrompt = readLine()?.lowercased() ?? "no"
        if losePrompt == "yes" {
            resetGame()
        } else {
            print("Goodbye!")
            break
        }
    }
    print("Enter your character here:", terminator: " ")
    let userInput = readLine()?.lowercased() ?? "" // user Input readLine
    
    if userInput.count > 1 || !alphabet.contains(userInput) || correctGuess.contains(userInput) || lettersGuessed.contains(userInput) { // If user enters more than 1 character or anything else - reject
        sleep(1)
        print("please try again")
        print()
        continue
    }
    if randomWord.contains(userInput) { // takes user input, if correct appends index key to indices var
        print()
        for (index, char) in randomWord.enumerated() {
            if userInput.contains(char) {
                indices.append(index)
                correctGuess.append(userInput)
                winWord.append(userInput)
            }
        }
        for (index, _) in underscoresFromRandomWord.enumerated() { // replaces respective index value (provided indices) with userinput
            if indices.contains(index) {
                underscoresFromRandomWord[index] = Character(userInput)
            }
        }
        indices.removeAll()
    }
    if !randomWord.contains(userInput) {
        //  print("This word does not contain that character, try again")
        guessCounter += 1
        lettersGuessed.append(userInput + ", ")
    }
    print()
    if guessCounter > maxGuesses {
        
        print(hangManFinal)
        print("You lost! The man has been hung")
        sleep(1)
        print("Would you like to play again?")
        let losePrompt = readLine()?.lowercased() ?? "no"
        if losePrompt == "yes" {
            resetGame()
        } else {
            print("Goodbye!")
            break
        }
    }
    switch guessCounter {
    case 0:
        print()
        print(hangManEmpty)
    case 1:
        print()
        print(hangMan1)
    case 2:
        print()
        print(hangMan2)
    case 3:
        print()
        print(hangMan3)
    case 4:
        print()
        print(hangMan4)
    case 5:
        print()
        print(hangMan5)
    case 6:
        print()
        print(hangManFinal)
    default:
        print()
    }
    
    
    
    
    
    
    
    //    if guessCounter == 0 {
    //        print("\n")
    //        print(hangManEmpty)
    //    }
    //    if guessCounter == 1 {
    //        print()
    //        print(hangMan1)
    //    }
    //    if guessCounter == 2 {
    //        print()
    //        print(hangMan2)
    //    }
    //    if guessCounter == 3 {
    //        print()
    //        print(hangMan3)
    //    }
    //    if guessCounter == 4 {
    //        print()
    //        print(hangMan4)
    //    }
    //    if guessCounter == 5 {
    //        print()
    //        print(hangMan5)
    //    } // Can I switch this out with a switch statement? ;)
    if randomWord.contains(userInput) {
        print("You made a correct guess!")
    } else {
        print("Incorrect guess, try again")
    }
    print()
    print("Incorrect letters guessed: \(lettersGuessed)")
    print()
    print("Current progress: \(String(underscoresFromRandomWord))")
    print()

} while repeatCondition
