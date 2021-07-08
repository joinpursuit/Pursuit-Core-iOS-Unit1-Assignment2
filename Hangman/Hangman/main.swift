//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

/* Greetings */
print("Welcome to Hangman!")
var firstMenu = false
var fullGame = false
var exit = false

print("What would you like to do?\n1) Play\n2) Exit")
repeat {
    if let response = readLine() {
        switch response.lowercased() {
        case "1", "play":
            print("You chose 1) Play")
            firstMenu = false
            fullGame = true
        case "2", "exit":
            print("BYE! AddCODE")
            firstMenu = false
            fullGame = false
            exit = true
        default:
            print("Invalid answer!")
            firstMenu = true
        }
    }
} while firstMenu







/* Full Game Code */
/* Variables */
let allWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var strikes = 6
var tries = 0
var totalTries = 0
var selectWord: String
var word: [Character] = []
var answer: [Character] = []
var badPile: [Character] = []
var secondMenu = true
var game: Bool = true
var totalLetters = 0
let alphabet: [Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var hangMan = """
|--------=
|        |
|        |
|
|
|
|     _______
|____|_______|_______
"""
while fullGame {

    print("Fasten your seat belts! The game is starting!")
    print("Choosing a random word...")
    selectWord = allWords.randomElement()!
    for i in selectWord {
        word.append(i)
        totalLetters += 1
    }
    for _ in word {
        answer.append("_")
    }
    print("Ah ha! Try to guess this one! It has \(totalLetters) letters!")
    for i in answer {
        print(i, terminator: " ")
    }
    print("")
    /* Test print - Delete after*/
    print(word)

/* The CRAZY part */
    repeat {
        if let response = readLine() {
            if response.count != 1 {
                print("Only enter one character.")
                continue
            }
/* Add Hangman? */
            totalTries += 1
            let char = Character(response.lowercased())
            /* Detect only letters*/
            if !alphabet.contains(char){
                print("Please only enter alphabets")
                continue
            }
            /* Detect duplicates*/
            if word.contains(char) {
                if answer.contains(char) {
                    print("You have already chosen letter \(char) before")
                }
                for i in 0..<word.count { // counts the amount of index in array
                    for _ in word { // for every element in array
                        if word[i] == char { // compares element in that index to user response
                            answer[i] = word[i] // if it is true it then pushes the letter in the WORD array and changing the _ blank space in ANSWER array to the same index
                            /* Winning part */
                            if word == answer { // if both the arrays are the same it does the following
                                print("You've solved the puzzle! Word is \(selectWord)")
                                print("It took you total of \(totalTries) tries to guess the word! Nice!")
                                game = false // turns off game statement to false so it doesn't loop anymore
                                break // stops the loop so it skips everything and gets to the next loop or condition
                            }
                        }
                    }
                }
                print(hangMan)

                for i in answer {
                    print(i, terminator: " ")
                }
                print("")

            } else if badPile.contains(char) {
                print("You have already chosen letter \(char) before")
            } else {
/* Else Begin for lose and win */
                tries += 1
                switch tries {
                case 0:
                    hangMan = """
                    |--------=
                    |        |
                    |        |
                    |
                    |
                    |
                    |     _______
                    |____|_______|_______
                    """
                case 1:
                    hangMan = """
                    |-------=
                    |       |
                    |      _|_
                    |     (x_X)
                    |
                    |
                    |     _______
                    |____|_______|_______
                    """
                case 2:
                    hangMan = """
                    |-------=
                    |       |
                    |      _|_
                    |    _(x_X)_
                    |    (__o__)
                    |
                    |     _______
                    |____|_______|_______
                    """
                case 3:
                    hangMan = """
                    |-------=
                    |       |
                    |      _|_
                    |    _(x_X)_
                    |   /(__o__)
                    |
                    |     _______
                    |____|_______|_______
                    """
                case 4:
                    hangMan = """
                    |-------=
                    |       |
                    |      _|_
                    |    _(x_X)_
                    |   /(__o__)\\
                    |
                    |     _______
                    |____|_______|_______
                    """
                case 5:
                    hangMan = """
                    |-------=
                    |       |
                    |      _|_
                    |    _(x_X)_
                    |   /(__o__)\\
                    |     |_|
                    |     _______
                    |____|_______|_______
                    """
                case 6:
                    hangMan = """
                    |-------=
                    |       |
                    |      _|_
                    |    _(x_X)_
                    |   /(__o__)\\
                    |     |_|_|
                    |     _______
                    |____|_______|_______
                    """
                default:
                    print("Invalid value for hangman, should be done on 6.")
                }
                print("Sorry! There are no \(char)'s")
                print("Throwing \(char) in the bad pile!")
                badPile.append(char)
                let remaining = strikes - tries
                print("Bad pile :")
                print(hangMan)
                for i in badPile {
                    print(i, terminator: " ")
                }
                print("")
                print("You have \(remaining) tries left")
                for i in answer {
                    print(i, terminator: " ")
                }
                print("")

/* Print Bad Pile */
                if tries == strikes {
                    print("Oh No! You've lost! The word was \(selectWord)")
                    print("Took you total of \(totalTries) tries.")
                    game = false
                    break
                }
            }
/* Else End for lose and win */
        }
    } while game
    
/* Second Menu - Play Again? */
    repeat {
        print("Would you like to play again?\n1) Yes\n2) No")
        if let response = readLine() {
            switch response.lowercased() {
            case "1", "yes":
                print("Woot! Restarting game")
                answer = []
                word = []
                totalLetters = 0
                tries = 0
                game = true
                secondMenu = false
                exit = false
            case "2", "no":
                print("Nope!")
                game = false
                secondMenu = false
                fullGame = false
                exit = true
            default:
                print("Invalid response!")
            }
        }
    } while secondMenu
}

while exit {
    print("Hope you had an enjoyable time!")
    exit = false
}
