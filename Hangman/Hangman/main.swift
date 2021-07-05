//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young","zebra"]

var someBool = true
var winStatus = true
var guessWord = " "
while someBool{
    //Keep Track of number of wrong guesses
    var wrongCount = 0
    var guessCount = 0
    var guessedAlreadyArray = [String]()
    var guessWordStringArr = [String]()
    
    
    
    
    //Pick Random Word from word bank
    
    if let pickedWord = allTheWords.randomElement(){
        guessWord = pickedWord
        // print(guessWord)
    }
    var guessWordArray = Array(guessWord)
    for i in 0..<guessWordArray.count{
        guessWordStringArr.append(String(guessWordArray[i]))
    }
    
    //print(guessWordArray)
    // print(guessWordStringArr)
    // let characters = Array(string)
    //
    //    for i in 0..<guessWordArray.count {
    //        thisArray.append(String(guessWordArray[i]))
    //
    //    }
    
    
    //Stuff found Online
    //var blankSpace = "_"
    //let blanks = String(repeating: "_", count: guessWord.count)
    //================================================================================================
    
    print("pick a letter of the alphabet")
    var wordHolderArray = Array(repeating: "_", count: guessWordArray.count)
    //while myArray.count > wordHolderArray.count{
    //    wordHolderArray.append("_")
    //}
    print(wordHolderArray)
    //var printString = ""
    //for i in 0..<wordHolderArray.count{
    //    printString += wordHolderArray[i]
    //}
    print("")
    var whileCondition = true
    //var printHangman = true
    while whileCondition && wordHolderArray.contains("_"){
        if let input = readLine() {
            
            if input.count == 1 {
                guessedAlreadyArray.append(input.uppercased())
                //Check against guess letters
                //     if wordHolderArray.contains("_") == false {
                //        print("""
                //
                //            you win. it took  \(guessCount) trys
                //
                //
                //            """)
                //        whileCondition = false
                //    //print(myArray.contains(input))
                //    }
                if guessWordStringArr.contains(input){
                    for i in 0..<guessWordStringArr.count {
                        if input == guessWordStringArr[i]{
                            wordHolderArray[i] = input.uppercased()
                            guessCount += 1
                            // print("\(6 - wrongCount) trys left")
                        }
                    }
                }else{
                    wrongCount += 1
                    guessCount += 1
                    //print("\(6 - wrongCount) trys left")
                    if wrongCount < 6 {
                        whileCondition = true
                    }else {
                        whileCondition = false
                        winStatus = false
                    }
                    
                }
                
            }else {
                print("one character at a time please")
            }
        }
        
        switch wrongCount{
        case 0:
            print("""
                ======================================================================================
                ______
                |    |
                |
                |
                |
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                Six Trys Remaining
                
                
                """)
        case 1 :
            print("""
                ======================================================================================
                ______
                |    |
                |    💀
                |
                |
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                Five Trys Remaining
                
                
                """)
        case 2 :
            print("""
                ======================================================================================
                ______
                |    |
                |    💀
                |     𝟶
                |
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                Four Trys Remaining
                
                
                """)
        case 3 :
            print("""
                ======================================================================================
                ______
                |    |
                |    💀
                |   ⫍𝟶
                |
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                Three Trys Remaining
                
                
                """)
        case 4 :
            print("""
                ======================================================================================
                ______
                |    |
                |    💀
                |   ⫍𝟶⫎
                |
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                Two Trys Remaining
                
                
                """)
        case 5 :
            print("""
                ======================================================================================
                ______
                |    |
                |    💀
                |   ⫍𝟶⫎
                |    /
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                One Try Left
                
                
                """)
        case 6 :
            print("""
                ======================================================================================
                ______
                |    |
                |    💀
                |   ⫍𝟶⫎
                |    /\\
                __________
                \(wordHolderArray)
                Letters Already Guessed : (\(guessedAlreadyArray))
                ======================================================================================
                Game Over
                
                
                """)
        default:
            print("default")
            
        }}
    
    if winStatus {
        print("""
            You Won!
            You guessed \(guessCount) times
            """)
    }else {
        print("""
            Nice try, but no, you lost
            The word was \(guessWord.uppercased())
            You guessed \(guessCount) times
            
            
            """)
    }
    
    
    print("""
Play again?
Yes or No
""")
    if let playAgain = readLine() {
        if playAgain.lowercased() == "yes" {
            someBool = true
        }else if playAgain == "no"{
            someBool = false
        }else {
            print("please type yes or no")
        }
        
    }
}




