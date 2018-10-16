//
//  main.swift
//  Hangman
//
//  Created by Jane Zhu on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

print("💀 Welcome to Hangman 💀")

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var strike = 0

let strike1 = """
0000000000000
0           0
0           1
0          1 1
0           1
0
0
0
0
0
0
0
0
0
0
"""

let strike2 = """
0000000000000
0           0
0           1
0          1 1
0           1
0           2
0           2
0           2
0
0
0
0
0
0
"""

let strike3 = """
0000000000000
0           0
0           1
0          1 1
0           1
0          32
0         3 2
0        3  2
0
0
0
0
0
0
0
"""

let strike4 = """
0000000000000
0           0
0           1
0          1 1
0           1
0          324
0         3 2 4
0        3  2  4
0
0
0
0
0
0
0
"""
let strike5 = """
0000000000000
0           0
0           1
0          1 1
0           1
0          324
0         3 2 4
0        3  2  4
0          5
0         5
0        5
0       5
0
0
0
"""

let strike6 = """
0000000000000
0           0
0           1
0          1 1
0           1
0          324
0         3 2 4
0        3  2  4
0          5 6
0         5   6
0        5     6
0       5       6
0         DEAD
0
0
"""

let wordChoice = allTheWords[Int.random(in: 0...allTheWords.count-1)]
let wordChoiceAsArray = Array(wordChoice)
print(wordChoiceAsArray)

var wordChoiceDisplay: String = ""

for _ in wordChoiceAsArray {
    wordChoiceDisplay += "_ "
}
print(wordChoiceDisplay)

print("This word has \(wordChoice.count) letters")

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let alphabetArray = Array(alphabet)

var loopRepeat: Bool = true
var loopExit: Bool = false


var guessCounter: Int = 0
var strikeCounter: Int = 0


repeat {
    print("Please enter a letter.")
    if let guessLetter1 = readLine() {
        for alphabet in alphabetArray {
            if guessLetter1.lowercased() == String(alphabet) {
                print("You chose \"\(guessLetter1)\".")
                loopRepeat = false
                for letter in wordChoiceAsArray {
                    // comparing guess letter against
                    wordChoiceDisplay = ""
                    if guessLetter1 == String(letter) {
                        for letter in wordChoiceAsArray {
                            if String(letter) == guessLetter1 {
                                wordChoiceDisplay += "\(letter) "
                            } else {
                                wordChoiceDisplay += "_ "
                        }
                        }
                        print(wordChoiceDisplay)
                    }
                    else {
                        strikeCounter += 1
                        switch strikeCounter {
                        case 1:
                            print(strike1)
                            break
                        case 2:
                            print(strike2)
                            break
                        case 3:
                            print(strike3)
                            break
                        case 4:
                            print(strike4)
                            break
                        case 5:
                            print(strike5)
                            break
                        default:
                            print(strike6)
                            break
                        }
                    }
                    }
                
            }
        }
    } else {
        print("Invalid input. Please try again")
    }
} while loopRepeat


//    if alphabet.contains(guess1.lowercased()) {
//        print("You chose \(guess1).")
//        loopRepeat = false
//    }
//        else {
//            print("Invalid input. Try again")
//            sleep(1)
//    }
//}






var maximumGuess = 8
var playerWins: Bool



// when player wins, give them the choice of restarting the game. 

// embed this in a if/else under playerwins... this is the scenario for when the player loses
//print("Do you want to see the answer. /n(yes) or (no)")
//var revealAnswerChoice = readLine()
//if let answer = revealAnswerChoice {
//    if answer.lowercased() == "yes" {
//    print("The correct answer is: \(wordChoice)")
//    } else {
//    print("Maybe you can figure it out later.")
//}
//} else {
//    print("Invalid answer")
//}

