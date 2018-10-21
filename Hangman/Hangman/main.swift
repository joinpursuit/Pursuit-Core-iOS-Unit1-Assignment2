//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let hangmanSix = """
++++++++++++++++++++++++++++++++++++++
        H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||             Q
        ||           __|__
        ||             |
        ||            / \
        ||           /   \
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""

let hangmanFive = """

++++++++++++++++++++++++++++++++++++++
        H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||             Q
        ||           __|__
        ||             |
        ||            /
        ||           /
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""


let hangmanFour = """

++++++++++++++++++++++++++++++++++++++
H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||             Q
        ||           __|__
        ||             |
        ||
        ||
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""

let hangmanThree = """

++++++++++++++++++++++++++++++++++++++
        H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||             Q
        ||           __|
        ||             |
        ||
        ||
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""

let hangmanTwo = """

++++++++++++++++++++++++++++++++++++++
        H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||             Q
        ||             |
        ||             |
        ||
        ||
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""

let hangmanFirst = """

++++++++++++++++++++++++++++++++++++++
        H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||             Q
        ||
        ||
        ||
        ||
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""



let hangmanBegins = """

++++++++++++++++++++++++++++++++++++++
        H A N G M A N
++++++++++++++++++++++++++++++++++++++

        ================
        || /           |
        ||/            |
        ||
        ||
        ||
        ||
        ||
        ||
        ||
 *      ||     *                   *
*|*     ||  * *|*                 *|*
 |      ||  |  |                   |
=======================================

"""

//
let words = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
//
//

var randomWord = words.randomElement()?.uppercased()

var randomWordUnwrapped: String = ""
var randomWordAsArray = [String]()
var blanks:String = ""


if let safeAllTheWordsRandom = randomWord {
    randomWordUnwrapped = safeAllTheWordsRandom
    randomWordAsArray.append(randomWordUnwrapped)
    blanks = String(repeating: "_", count: randomWordUnwrapped.count)
}

var blanksAsArray: [String] = ([blanks])


let alphabet = """
Letters to choose from:

A, B, C, D, E, F, G, H, I, J, K, L, M,
N, O, P, Q, R, S, T, U, V, W, X, Y, Z
"""

let initialMessage = """

H A N G M A N

Do you want to help save a life?

Press [1] for Yes or [2] for No:

"""

var startGame = true
var userChoseToPlay = 0

repeat {
    print(initialMessage)
    let doYouWantToPlay = readLine()
    let userWantsToPlay = doYouWantToPlay ?? ("not a valid selection")
    
    if let userWantsToPlayInt = Int(userWantsToPlay){
        userChoseToPlay = userWantsToPlayInt
    }
    
} while userChoseToPlay != 1


let gameSetUp = """

\(blanksAsArray)

This is a \(randomWordUnwrapped.count) letter word

\(alphabet)

"""


var letterUserEnteredIndex = 0 // I NEED THIS TO LOCATE WHERE TO PRINT LETTER IN BLANKS

var countingFailedAttempts = 7
var arrayOfWrongLetters = [String]()

print(randomWordAsArray)
var gameOn = true

while gameOn == true {
    
    if countingFailedAttempts != 0{
        gameOn = true
    } else if countingFailedAttempts == 0 {
        gameOn = false
}
    
    
    print(gameSetUp)
    
    
    let enterLetter = readLine()?.uppercased()
    let letterUserEnteredUnwrapped = enterLetter ?? "nothing"
    
    
    if randomWordAsArray.contains(letterUserEnteredUnwrapped){
        for (index, element) in randomWordAsArray.enumerated(){
            if letterUserEnteredUnwrapped == element{
                letterUserEnteredIndex = index
                blanksAsArray[letterUserEnteredIndex] = element
                print(blanksAsArray)
            }
        }
        
    } else if !randomWordAsArray.contains(letterUserEnteredUnwrapped){
        countingFailedAttempts = countingFailedAttempts - 1
        arrayOfWrongLetters.append(letterUserEnteredUnwrapped)
        switch countingFailedAttempts{
        case 1:
            print(hangmanSix)
            print("A man has lost his life...")
            print("Wrong letters that will cost you a life: \(arrayOfWrongLetters)")
            gameOn = false
            
        case 2:
            print(hangmanFive)
            print("You have \(countingFailedAttempts) opportunities left to save a life")
            print("Wrong letters that will cost you a life: \(arrayOfWrongLetters)")
            
        case 3:
            print(hangmanFour)
            print("You have \(countingFailedAttempts) opportunities left to save a life")
            print("Wrong letters that will cost you a life: \(arrayOfWrongLetters)")
            
        case 4:
            print(hangmanThree)
            print("You have \(countingFailedAttempts) opportunities left to save a life")
            print("Wrong letters that will cost you a life: \(arrayOfWrongLetters)")
            
        case 5:
            print(hangmanTwo)
            print("You have \(countingFailedAttempts) opportunities left to save a life")
            print("Wrong letters that will cost you a life: \(arrayOfWrongLetters)")
            
        case 6:
            print(hangmanFirst)
            print("You have \(countingFailedAttempts) opportunities left to save a life")
            print("Wrong letters that will cost you a life: \(arrayOfWrongLetters)")
            
        default:
            print("Do you want to play again?")
        }
    }
    
}

