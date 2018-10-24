//
//  main.swift
//  Hangman
//
//  Created by Kathy Marte on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
//------------ Class Assigment 2 --------------------
/*
 
 
 //        for i in 0..<randomWordArray.count{
 //            if userResponse.lowercased() == randomWordArray[i]{
 //              dashesArray[i] = randomWordArray[i]
 //                print(dashesArray)
 //            }
 ////            }else{
 ////                print("minuns 1 chance")
 ////                chances += 1
 ////
 ////            }
 //
 //            if userResponse.lowercased() != randomWordArray[i]{
 //                print("minuns 1 chance")
 //                chances += 1
 //        }
 //
 //    }
 //}else{
 //}
 
 
 //print(randomWordArray)
 
 
 
 
 
 
 //unwrap a second time and  loop through the random word
 
 ////repeat while there is a character in string - print dash code to compare to user readLine
 
 //
 //-----tuple/array
 //var savedUserResponse = [String?]() //save and mipulate users responses in characters to replace a dash each?
 //if let userResponse = readLine(){
 //    if let savedUserResponse = userResponse{
 //
 //    }
 //
 //
 //}
 /*optional string because possible response could be nil or invalid. must use optional binding or guards*/
 
 //var wrongChoice =   /*to hold non working choices? is this necessary?
 
 
 Instructions for lab submission
 Fork the assignment repo
 Clone your Fork to your machine
 Complete the lab
 Push your changes to your Fork
 Submit a Pull Request back to the assignment repo
 Paste a link to your Pull Request (not your fork!) on Canvas and submit
 For this assignment, you will build hangman
 
 Requirements
 The user must be able to play against the computer
 The word that the computer chooses must be random. There is a large array of words below.
 The user must have a limited number of guesses
 After each guess, the computer should print out the current state of the word you are guessing. (ex. A _ _ L E, for apple)
 After each guess the computer should print out how many guesses you have remaining. For full credit, make it actually print out a picture somewhat similar to the link above.
 The computer should tell the user if she wins, show her how many guesses it took and end the current game
 The user should see the correct answer if she loses
 The user should have the option to play the game again.*/
 
 */

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
/*
 add bellow :Visual Candy, Welcome Message, Game Instructions- enter to play,
 */

//-------created a var to use randomWord globally
var globallyUsedVarRandomWord = " "

//-------user prompts
print("""

            Welcome To Hangman


        """)

//2 sec delay for message
sleep(1)
print("""
        

            choose your letters wisely

        

        """)
//if the word is this long allow this many hints

//2 sec prompt delay for dashes of randomWord to guess
sleep(2)


//------Declaring empty Arrays for randomword and its 'clone' array
var randomWordArray = [String]()
var dashesArray = [String]()


//------random word selector with if let to safe unwrapp ------------------
if let randomWord = allTheWords.randomElement(){
    globallyUsedVarRandomWord = randomWord
    
//------loop tells count of dashes to add
    for _ in randomWord {
        dashesArray += ["_"]
        }
}else{
            print("something went wrong")
        }
print(dashesArray)

//----convert character array back into a array of strings separated by ' ' ea,instead of a single word to be ==
var randomWordArrayCharacter = Array(globallyUsedVarRandomWord)
for i in 0..<randomWordArrayCharacter.count{
    randomWordArray.append(String(randomWordArrayCharacter[i]))
}

// -----omit at end of project
print(randomWordArray)


//------get users entered character safely unwrapped
//while loop begins

var chancesCount = 1
while chancesCount <= 6 {
if let userResponse = readLine(){
    if userResponse.count == 1 {
        //print(userResponse)
 

//add it to an array to check it if like other chars in other array. holds dashes to replace by index? how the computer put == character where belongs
        if randomWordArray.contains(userResponse.lowercased()){
            for i in 0..<randomWordArray.count{
                if userResponse == randomWordArray[i]{
                    dashesArray[i] = randomWordArray[i]
                   
              //check if is too many ifs -below
                }
       }
 }
    else if !randomWordArray.contains(userResponse.lowercased()){
        chancesCount += 1
            for i in 0..<chancesCount{
                if i == 6{
                print("The right word is \(globallyUsedVarRandomWord)")
                }
            }
        print("\(7 - chancesCount) chances left")
        

        }
    
}else {
    print("please guess a letter")
    print("invalid entry")
    }

    print(dashesArray)
    if dashesArray == randomWordArray{
        print("you won!")
          sleep(1)
          print("Play Again? y or n")
        if let playAgain = readLine(){
            switch playAgain{
            case "no" :
                print("Thanks for playing")
                break
            case "yes" :
                chancesCount = 1
                continue
            default:
                print("yes or no ?")
            }
        }
    
    }
}
}
