//
//  main.swift
//  hangmeplease
//
//  Created by Ahad Islam on 10/8/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

//print("Hello, World!")
//print("I'm going to hang myself.")
//print("Goodbye, World!")

let allTheWords = [
    "able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
let alphabet = "abcdefghijklmnopqrstuvwxyz"
let alphabetSet = Set(alphabet)

var winOrLose = true
var exit = false
var yes = ["y","yes","yeah","sure","why not","ok","k","1"]
var guessCount = 0

func guessMan (count num: Int) -> String {
    let stringMan = """
  +---+
  |   |
      |
      |
      |
      |
=========
"""
    let stringMan1 = """
  +---+
  |   |
  O   |
      |
      |
      |
=========
"""
    let stringMan2 = """
  +---+
  |   |
  O   |
  |   |
      |
      |
=========
"""
    let stringMan3 = """
 +---+
  |   |
  O   |
 /|   |
      |
      |
=========
"""
    let stringMan4 = """
  +---+
  |   |
  O   |
 /|\\  |
      |
      |
=========
"""
    let stringMan5 = """
  +---+
  |   |
  O   |
 /|\\  |
 /    |
      |
=========
"""
    let stringMan6 = """
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
      |
=========
"""
    switch num {
    case 6:
        return (stringMan)
    case 5:
        return (stringMan1)
    case 4:
        return (stringMan2)
    case 3:
        return (stringMan3)
    case 2:
        return (stringMan4)
    case 1:
        return (stringMan5)
    default:
        return (stringMan6)
    }
}
func Hangman () {
    let word = allTheWords.randomElement() ?? "liverwurst"
    let wordArray = Array(word)
    let numberOfGuesses = 6
    var emptyString = [String]()
    var currentNumberOfGuesses = numberOfGuesses
    var lettersUsed: Set<String> = []
    guessCount = 0
    
    for _ in word {
        emptyString.append("_")
    }
    
    while emptyString.contains("_") {
        print(guessMan(count: currentNumberOfGuesses))
        print(emptyString.joined())
        print("Choose a letter, you have \(currentNumberOfGuesses) guesses remaining.       Letters used: '\(lettersUsed.sorted().joined())'")
        
        let response = readLine()?.lowercased() ?? ""
        
        if response.count != 1 || alphabet.contains(response) == false {
            print("Must write a single alphabet.")
            sleep(1)
            print()
            continue
        } else if lettersUsed.contains(response) {
            print("You've used the letter '\(response)' already, try a different character.")
            sleep(1)
            print()
            continue
        } else if word.contains(response) {
            for index in 0..<wordArray.count {
                if wordArray[index] == Character(response) {
                    emptyString[index] = response
                }
            }
            lettersUsed.insert(response)
        } else if currentNumberOfGuesses > 1 {
            print("Wrong answer")
            currentNumberOfGuesses -= 1
            lettersUsed.insert(response)
        } else {
            print(guessMan(count: 7))
            print("You lost, the answer was: '\(word)'")
            winOrLose = false
            break
        }
        
        guessCount += 1
        sleep(1)
        print()
        print()
    }
}

while exit == false {
    Hangman()
    switch winOrLose {
    case false:
        print("Darn! Would you like to play again?")
    default:
        print("You won! It took you \(guessCount) guesses in order to win.  Would you like to play again?")
    }
    let choice = readLine() ?? ""
    if yes.contains(choice) {
        continue
    } else {
        break
    }
}

//dont let them keep choosing the same letter, maybe have a set to insert to show which letters have to be used.
//
