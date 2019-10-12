//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



//## Requirements
//
//[X] The user must be able to play against the computer
//[X] The word that the computer chooses must be random. There is a large array of words below.
//[X]The user must have a limited number of guesses
//[X] After each guess, the computer should print out the current state of the word you are guessing.  (ex. A _ _ L E, for apple)
//[X] After each guess the computer should print out how many guesses you have remaining.  For full credit, make it actually print out a picture somewhat similar to the link above.
//[X] The computer should tell the user if she wins, show her how many guesses it took and end the current game
//[X] The user should see the correct answer if she loses
//[X] The user should have the option to play the game again.
print("Let's play Hangman")
print("Try to guess the word, enter a chracter, you have 6 attempts. Good Luck!")

let allTheWords = [
    "able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]


var randomWord = allTheWords.randomElement() //pulls up random word
var chosenWord = randomWord ?? "" //unpacks the word
var arrayChosenLetters = Array(chosenWord) // changes random word into an array, word chosen by computer
var letterInputArray = Array<String>() //place for the letters inputed by player
var triesLeft = 6 //The user must have a limited number of guesses
var guess = 0 // times the player tried
var underScore: [Character] = Array(String(repeating: "_", count: chosenWord.count))
let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
let filter = alphabet


var asciiLost = """
 ____________
    |/      |
    |      (_)
    |       |
    |       |
    |      | |
    |
    |
  __|___
"""

var ascii1 = """
 __________
    |/    
    |
    |
    |
    |
    |
  __|___
"""

var ascii2 = """
 ____________
    |/      |
    |
    |
    |
    |
    |
  __|___
"""

var ascii3 = """
 ____________
    |/      |
    |      (_)
    |
    |
    |
    |
  __|___
"""

var ascii4 = """
 ____________
    |/      |
    |      (_)
    |       |
    |
    |
    |
  __|___
"""

var ascii5 = """
 ____________
    |/      |
    |      (_)
    |       |
    |       |
    |
    |
  __|__
"""

var ascii6 = """
 ____________
    |/      |
    |      (_)
    |       |
    |       |
    |      |
    |
    |
  __|___
"""


print(ascii1)
print("Choose one letter and hit enter")

hangman: repeat {

    print(String(underScore))
    print(chosenWord)
    
    let letterInput = readLine()?.lowercased() ?? "0"
    
    if letterInput.count > 1 || !filter.contains(letterInput){
        print("Please enter one letter")
        
        continue
    }
       switch triesLeft {
       case 6:
           print(ascii2)
       case 4:
           print(ascii3)
       case 3:
           print(ascii4)
       case 2:
           print(ascii5)
       case 1:
           print(ascii6)
//       case 0:
//           print(asciiLost)
//           print("Nice try, you lost. the word was \(chosenWord)  Please play again")
       default:
           print(ascii1)
    }
    if !chosenWord.contains(letterInput) && triesLeft != 0 {
        triesLeft -= 1
        guess += 1
        letterInputArray.append(letterInput)
        let printTriesLeft = String(triesLeft)
           print("You typed in the wrong letter \(letterInput), you have \(printTriesLeft) attempts left. You already tried \(letterInputArray)")
        continue
    }
    for (index, char) in chosenWord.enumerated() where chosenWord.contains(letterInput) {
        if char == Character(letterInput) {
            underScore[index] = Character(letterInput)
            guess += 1
        }
    
    if !underScore.contains("_") {
        print("You won!!!! it took \(guess) guesses to find the word \(chosenWord)")
        break hangman
        }
    }
    
} while triesLeft > 0

if triesLeft == 0 {
print(asciiLost)
print("Nice try, you lost. the word was \(chosenWord)")
print("Would you like to play again \"yes\" or \"no\"")
    let playAgain = readLine()
    if playAgain == ("yes"){
        triesLeft = 6
        guess = 0
//hangman
    } else {
        print("Thanks for Playing")
    }
    
}
