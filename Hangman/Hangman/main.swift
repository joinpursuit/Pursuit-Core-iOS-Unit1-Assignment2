//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

let word = allTheWords.randomElement() ?? "bob"

// creating animation function:

func animation(wrongCount: Int){
    if wrongCount == 0 {
        print("""
             _____
            |     |
                  |
                  |
                  |
                 _|_
       You have 6 tries remaining
""")
    }
    
    if wrongCount == 1 {
        print("""
             _____
            |     |
            😟    |
                  |
                  |
                 _|_
       You have 5 tries remaining
""")
    }
    if wrongCount == 2 {
        print("""
                 _____
                |     |
                😓    |
                |     |
                |     |
                     _|_
          You have 4 tries remaining
""")
    }
    if wrongCount == 3 {
        print("""
                 _____
                |     |
                😰    |
              //|     |
                |     |
                     _|_
         You have 3 tries remaining
""")
    }
    if wrongCount == 4 {
        print("""
                 _____
                |     |
                😫    |
              //|\\   |
                |     |
                     _|_
        You have 2 tries remaining
""")
    }
    if wrongCount == 5 {
        print("""
                 _____
                |     |
                😖    |
              //|\\   |
                |     |
              //     _|_
        You have 1 try remaining
""")
    }
    if wrongCount == 6 {
        print("""
                 _____
                |     |
                😵    |
              //|\\   |
                |     |
              // \\  _|_
            """)
    }
}

// Creating hidden word:

var hiddenWord = [String]()
for _ in 1...word.count {
    hiddenWord.append("_")
}

// print(hiddenWord) // array
print(hiddenWord.joined(separator:"")) // String
var hiddenWordString: String
var selectedLetters: [String] = []

// setting number of turns:

let maxWrong = 6
var wrongCount = 0
var guessCount = 0
var playAgain: String = ""

// Game starts:

repeat{
    
print("""
                                                                               
 88                                                                                        88
 88                                                                                        88
 88                                                                                        88
 88,dPPYba,  ,adPPYYba, 8b,dPPYba,   ,adPPYb,d8 88,dPYba,,adPYba,  ,adPPYYba, 8b,dPPYba,   88
 88P'    "8a ""     `Y8 88P'   `"8a a8"    `Y88 88P'   "88"    "8a ""     `Y8 88P'   `"8a  88
 88       88 ,adPPPPP88 88       88 8b       88 88      88      88 ,adPPPPP88 88       88  88
 88       88 88,    ,88 88       88 "8a,   ,d88 88      88      88 88,    ,88 88       88
 88       88 `"8bbdP"Y8 88       88  `"YbbdP"Y8 88      88      88 `"8bbdP"Y8 88       88  88
                                     aa,    ,88
                                      "Y8bbdP"
                           
""")

print("Welcome to hangman!")
print("The Word: \(hiddenWord.joined(separator:""))")

// Loop for number of turns:
    
repeat {
    print(); sleep(1)
    print("Enter a letter")
    let choice = readLine()?.lowercased() ?? "n" // User enter letter choice
//====== maybe add another if statment that checks if the value is a single letter else have them try again? because when i enter 2 letter it says already entered ======//
    
    if alphabet.contains(choice) {
    var spotCounter = 0
    
    if word.contains(choice) { // checks if word contains the letter entered
        sleep(1); print()
        print("Found!")
        sleep(1)
        animation(wrongCount: wrongCount)
        
    for char in word { // loops through the word
       
        if choice == String(char) { // checks if user letter is = to char in word
           hiddenWord[spotCounter] = choice
        }
        spotCounter += 1
    }
        
    } else {
        print(); sleep(1)
        print("Not Found!")
        print(); sleep(1)
        wrongCount += 1
        animation(wrongCount: wrongCount)
        print(); sleep(1)
        
    }
    // Add choice to the already chosen array and print it
        selectedLetters.append(choice)
    // print already selected letter joined with " "
        print("\(hiddenWord.joined(separator:""))       Entered Letters: \(selectedLetters.joined(separator:" "))")
        
    // Remove letter from alphabat once chosen:
        
    let letterIndex = alphabet.index(of: choice)
    alphabet.remove(at: letterIndex ?? 2)
    // print(alphabet) // Prints alphabets after chosen letters have been removed.
    guessCount += 1

    } else {
        print("Has already been chosen, try again.")
    }

    hiddenWordString = hiddenWord.joined(separator:"")

} while wrongCount < maxWrong && word != hiddenWordString

// END OF GAME OUTPUT: YOU WIN OR LOSE

if wrongCount >= maxWrong {
    print("GAME OVER - YOUVE BEEN HUNG")
    print("The correct word was: \(word)")
} else if word == (hiddenWord.joined(separator:"")) {
    print(); sleep(1)
    print("YAY! You win, it took \(selectedLetters.count) tries ") //\(guessCount)
}
    print()
 
    print("Would you like to play again? Enter yes or no ")
    playAgain = readLine()?.lowercased() ?? "no"
    
 } while playAgain == "yes"





