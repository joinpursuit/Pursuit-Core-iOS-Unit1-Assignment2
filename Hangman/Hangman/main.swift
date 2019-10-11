//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

// Project 2

print(
    """

=====================
| |    / /
| |   / /
| |  / /
| | / /
| |/ /
| | /
| |
| |            HANGMAN
| |
| |
| |
| |
| |
| |
| |
| |
=========================

Please guess a character in this hidden word:

"""
)

// I want to show the number of underscores
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var randomWord = allTheWords.randomElement()!
var hiddenWord = Array<Character>(repeating: "_" , count:randomWord.count)
var showWrongAttempts: Array<Character> = []
var numberOfAttempts = 8
var condition = true

repeat {

    print(String(hiddenWord))
    
    let userLetterInput = readLine() ?? "z"
    // this is optional
    // readline will always give you a string or nil
    
    if randomWord.contains(userLetterInput) {
        print("RIGHT")
        
        
        for (index, letter) in randomWord.enumerated() { // this turns into an array
            if Character(userLetterInput) == letter { // convert string to character, char to char
                hiddenWord[index] = letter   // all have to the same datatype per line, string to string
            }
            
        }
        
        
    } else {
        print("WRONG")
        
        // showWrongAttempts
        
        numberOfAttempts -= 1
        // when they entered the wrong char
        // condition = false
        if numberOfAttempts == 0 {
            print("GAME OVER")
            condition = false
        }
        
        
        
    }
    

} while condition





//
//
//
//
//
//
//
//
//if attempted == 1 {
//    print(
//"""
//=====================
//| |    / /
//| |   / /
//| |  / /
//| | / /
//| |/ /
//| | /
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//=======================================
//
//     You have 8 guesses remaining.
//
//"""
//)
//} else if attempted == 2 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         ||
//| | / /          ||
//| |/ /
//| | /
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//=======================================
//
//     You have 7 guesses remaining.
//
//"""
//)
//} else if attempted == 3 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |                ````
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//=======================================
//
//     You have 6 guesses remaining.
//
//"""
//    )
//} else if attempted == 4 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |               ||````
//| |               ||
//| |               ||
//| |               ||
//| |
//| |
//| |
//| |
//| |
//| |
//=======================================
//
//    You have 5 guesses remaining.
//
//"""
//    )
//} else if attempted == 5 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |              /||````
//| |             / ||
//| |            /  ||
//| |            )  ||
//| |
//| |
//| |
//| |
//| |
//| |
//=======================================
//
//    You have 4 guesses remaining.
//
//"""
//    )
//} else if attempted == 6 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |              /||\\```
//| |             / || \
//| |            /  ||  \
//| |            )  ||   (
//| |
//| |
//| |
//| |
//| |
//| |
//=======================================
//
//     You have 3 guesses remaining.
//
//"""
//    )
//} else if attempted == 7 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |              /||\\```
//| |             / || \
//| |            /  ||  \
//| |           )   ||   (
//| |               /
//| |              /
//| |             /
//| |          __".
//| |
//| |
//=======================================
//
//     You have 2 guesses remaining.
//
//""")
//} else if attempted == 8 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||      ?
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |              /||\\```
//| |             / || \
//| |            /  ||  \
//| |           )   ||   (
//| |               /\
//| |              /  \
//| |             /    \
//| |          __".     ."__
//| |
//| |
//=======================================
//
//       You have 1 guess remaining.
//
//"""
//    )
//} else if attempted == 9 {
//    print(
//"""
//=====================
//| |    / /       ||
//| |   / /        ||
//| |  / /         | ----..
//| | / /          /      \\
//| |/ /           ||  `/, |
//| | /             \\ -  /
//| |              /||\\```
//| |             / || \
//| |            /  ||  \
//| |           )   ||   (
//| |               /\
//| |              /  \
//| |             /    \
//| |          __".     ."__
//| |     🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹
//| | 🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌵
//=======================================
//"""
//    )
//}

//for char in hiddenWord {
//    guessMax -= 1
//}




// var indices = [Int]()


// a new photo
//=====================
//| |    / /
//| |   / /
//| |  / /
//| | / /
//| |/ /
//| | /
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//| |
//=========================

// ex. A _ _ L E, for apple


//print("""
//You have a total of BLANK guesses remaining.
//""")
//
//print("""
//
//You took a total amount of BLANK guesses.
//
//""")

// 1. How to make the computer generate a random word (internal)
    
    // Loop through the array
    // var indices = [Int]()
    
// 2. How to make the computer print _ for the number of length of the word (external)
    
    // .count()
    // repeat _ for count

// 3. Guesses max is 8.

// 4. the computer should protect the user from entering anything else than a character
    // check for one character and if the character part of the word.
    // this should all be in lowercased()

// 5. Each input from user should print current state of guess word... readline()

// 6. Decrement guess count // guessMax -= 1

// 7. Keep track of entered character





// loop 1
// where to find where the indices are
    // var indices = [Int]()
    // for (index, char) in arr.enumerated() {
    // } if enteredChar == char {
    // indices.append(index).count
    //}


// loop 2
/* for (index, _ ) in hiddenWord.enumerated(){
   if indices.contains(index){
      hiddenWord[index] = enteredChar
 }
 }
 
 print(String(hiddenWord))
 
 // repeat while loop
 /*
 repeat {
 
 guessMax = 1
 
 } while guessMax > 0
 
 */


 
 
 
 
 





// the user will have 8 limited guesses

// After each guess, the computer should print out the current state of the word you are guessing. (ex. A _ _ L E, for apple)

// if you get it wrong and it should print out how many guesses you have left


// After each guess the computer should print out how many guesses you have remaining.



// The computer should tell the user if she wins, show her how many guesses it took and end the current game



//The user should see the correct answer if she loses



// The user should have the option to play the game again.

var something = readLine()
*/













// Things that I may use:

/*
 Replacing an element of an array using subscripting
 Optionals:
    Forced unwrapping
    Nil-coalescing
    Optional Binding
    Implicit Unwrapping
Switches
Control Transfer
isEmpty
Ternary Operator
If/ Else If/ Else Statement
.append()
 While
 Loops
 Nested
 .contains
 index-enumerated()
 Repeat While Loop
 Looping Through Array using a range
 Array Slice variable = [1...] // prints all elements starting at BLANK
 
 
 
 */
