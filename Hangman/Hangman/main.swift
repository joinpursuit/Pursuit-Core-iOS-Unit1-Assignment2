//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



// enter title, rules, "please guess a character in this hidden word, you have 6 guesses"!

print("""

   ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄
  ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌
  ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌░▌   ▐░▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌
  ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌▐░▌    ▐░▌▐░▌          ▐░▌▐░▌ ▐░▌▐░▌▐░▌       ▐░▌▐░▌▐░▌    ▐░▌
  ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌ ▐░▌   ▐░▌▐░▌ ▄▄▄▄▄▄▄▄ ▐░▌ ▐░▐░▌ ▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌ ▐░▌   ▐░▌
  ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌  ▐░▌▐░▌▐░░░░░░░░▌▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌  ▐░▌
  ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌   ▐░▌ ▐░▌▐░▌ ▀▀▀▀▀▀█░▌▐░▌   ▀   ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌   ▐░▌ ▐░▌
  ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌    ▐░▌▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌    ▐░▌▐░▌
  ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌     ▐░▐░▌
  ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌      ▐░░▌
   ▀         ▀  ▀         ▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀         ▀  ▀        ▀▀


Please guess a character in this hidden word. You have 6 guesses.

""")


// Database of Words
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var randomIndex = Int.random(in: 0..<allTheWords.count)
let randomWord = allTheWords[randomIndex]
var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)
let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
var guessMax = 6
var indices: Set<Int> = []
var lettersThatYouGuessed = [String]()
var guesses = [Int]()

var guessesIsCorrect = [Int]()



print(randomWord)
//var userContinue = readLine()?.lowercased()

repeat{
    
let userEntered = readLine()?.lowercased() ?? "a" // readLine because user needs to enter characters - also make sure that it only accepts one character and that one character is part of the alphabet
    
    
    if !randomWord.contains(userEntered) {
        guessMax -= 1
        print(guessMax)
    }
    
//    print(guessMax)
    
// loop 1 - keeps track of the index of entered characters
    for(index,char) in randomWord.enumerated() {
    if Character(userEntered) == char {
        indices.insert(index)
        indices.count
     
//        print(lettersThatYouGuessed)
    } else {
        if Character(userEntered) != char {//...does not equal the character in the string
        guesses.append(index)
        guesses.count
        print()//print what???
    }
}

}

    
       lettersThatYouGuessed.append(userEntered)
    print(lettersThatYouGuessed)
// loop 2 - uses the position that was saved and adds it to the dashes
for(index,_) in hiddenWord.enumerated() {
    if indices.contains(index) {
        hiddenWord[index] = Character(userEntered)
        indices.remove(index)
        print()//enter something here
    } else {
        
    }
}
   
print(String(hiddenWord)) // user sees a____


// loop 3
    if guessMax == 5 {
        print("""
            __________     \n
            |        |
        
        """)
    } else if guessMax == 4 {
        print("|         |    \n")
    } else if guessMax == 3 {
        print("|         |    \n")
    } else if guessMax == 2 {
        print("|         0    \n")
    } else if guessMax == 1 {
        print("|        /|\\  \n")
    } else if guessMax == 0 {
        print("|        / \\   \n")
    }
    

// 4
if guessMax == 0 {
    print("You lost")
        print("Would you like to play again?")
    
    
    if String(userEntered) == "yes" {
        //then loop back to beginning
        } else if String(userEntered) == "no" {
        } // then end game (break?)
    
    
        }

    
}while(guessMax>0)
    
  

// make it so you can play it again after one try
// After each guess the computer should print out how many guesses you have remaining. For full credit, make it actually print out a picture somewhat similar to the link above.
// The computer should tell the user if she wins, show her how many guesses it took and end the current game
// The user should see the correct answer if she loses
// The user should have the option to play the game again.



//var guesses: Int? = nil
//var word: String? = nil
//var gameWord = ""
//
//func checkGuess (character character: String) {
//    var guessIsCorrect =
//
//} if(!guessIsCorrect) {
//    guesses =
//}


// step 1. get a random word from the array => Array
// step 2. guesses max = 6
//  var guessMax = 6
// step 3. each input from user should print current state of guess word
// step 4. decriment by 1 after each guess - everytime we go through the loop, we decriment by 1
// guessMax -= 1
// step 5. generate an underscored version of the random word
//      .count
//      varhiddenWord = String(repeating:     "_", count: randomWord.count) //      _____
// hidden word has to be an array - convert to Array





// user should see the word hangman and some rules, instructions ("please guess a character in this hidden word, you have 6 guesses")and show some underscores


// step 6. readLine is happening because the user has to enter letters. A valid input from the user has to be one character ("a"). You can only accept one character. Check for only one character. Also want to check that the one character the user enters is part of the alphabet.
// step 7. work with an array, it's easier. can convert random word to an Array. if you have string "apple", you can convert it to an array by wrapping string in an array, and you get back an array of characters ["a", "p", "p", "l","e"], can LOOP through array, and keep an index of integers
// var indices = [Int]()
// for char in ["a", "p", "p","l","e"] array {}
// keep track of entered character!!!
// var grossMax = 6
// how do you keep track of the index of entered characters? use a for loop- loop1 (job to find where the indexes are) -> for(index, char) in arr.enumerated() {
//  if enteredChar == char
//  }
// loop 2 is to ... ->
// for (index,char) in hiddenWord.enumerated() {
//    if indices.contains(index)
//    hiddenWord[index] = enteredChar
// }
// print(String(hiddenWord)) // user sees a____


// repeat{
//  guessMax -=1
// }while(grossMax>0)
// var indices


//let appleWord = "apple"
//print(appleWord.count)



//
//let appleWord = "apple"
//print(appleWord.count)
//
//let randomWord = "apple"
//var hiddenWord = Array(repeating: "_", count: randomWord.count)
//
//let alphabets: Set<Character> = set("abcdefghijklmnopqrstuvwxyz")
//
//
////user enters a
////make it so it's not case sensitive
//
////loop 1
//var indices = [Int]()
//for(index,char) in randomWord.enumerated() {
//    if enteredChar == char {
//        indices.append(index).count
//
//
//    }
//}
////loop 2
//for(index,_) in hiddenWOrd.enumerated() {
//    if indices contains(index) {
//        hiddenWord[index] = enteredChar
//    }
//}
//print(String(hiddenWord))












