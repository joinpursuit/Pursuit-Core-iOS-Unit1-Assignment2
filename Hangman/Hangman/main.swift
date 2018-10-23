//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]


var randomword = allTheWords.randomElement()!

var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y", "z","A","B","C","D","E","F","G","H","I","J","K","L", "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var answer = String ()
while true {
    var alreadyChosen: [String] = []
    let oneStrike = """

    =============
    |           |
    |           😀
    |
    |
    |YOU HAVE 6 STRIKES LEFT
    |
    |🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
    let twoStrikes = """

=============
|           |
|           😬
|           👕
|
|YOU HAVE 5 STRIKES LEFT!!
|🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
    let threeStrikes = """

=============
|           |
|           😩
|         🤛👕
|
|YOU HAVE 4 STRIKES LEFT!!!!
|🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
    
    let fourStrikes = """

=============
|           |
|           😖
|         🤛👕🤜
|
|YOU HAVE 3 STRIKES LEFT!!!!!
|🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
    let fiveStrikes = """

=============
|           |
|           😭
|         🤛👕🤜
|             👞
|YOU HAVE 2 STRIKES LEFT!!!!!!!
|🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
    
    let sixStrikes = """

=============
|           |
|           😱
|         🤛👕🤜
|          👞 👞
|YOU HAVE 1 STRIKES LEFT!!!!!!!
|🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
    
    let severStrikes = """

=============
|           |
|           💀
|         🤛👕🤜
|          👞 👞
| 0 STRIKES LEFT!!!!!!!!
|  𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡!
|🔥🔥🔥🔥🔥🔥🔥🔥🔥
=====================
"""
var rightLetter = ""
var allowedStrikes = 0
var correct = 0

    print("""



𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ 𝔇𝔢𝔞𝔡 𝓐𝓵𝒾𝓿ℯ
  
                                💀  𝖍𝔞𝖓𝔤𝔪𝔞𝔫  💀
          ✞ WELCOME TO THE INQUISITION YOU'RE HANGING BY A NOOSE OVER FIRE ✞
                    YOU HAVE 7 OPPORTUNITIES TO FIND THE WORD
            EACH TIME YOU'RE INCORRECT THE NOOSE GET TIGHTER AND TIGHTER
                IF YOU FAIL YOU 𝔇𝔦𝔢 IF YOU FIND THE WORD YOU'LL 𝓵𝒾𝓿ℯ
                               👹 GOOD LUCK SINNER 👹
                               
                                SELECT PLAY[1] EXIT [2]
                               

                            *** PLEASE PLAY FULL SCREEN ***


🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥


""")
    if let userChoice = readLine() {
        if let userChoiceAsInt = Int(userChoice) {
            switch userChoiceAsInt{
            case 1:

                print("LET'S PLAY!")
                print("")
                
                randomword = allTheWords.randomElement()!
                print(randomword)
                print("WORD HAS \(randomword.count) LETTERS")
                for _ in 0..<randomword.count {
                    print(" _ ", terminator: "")
                }
                var replacedString = String()
                while correct < randomword.count && allowedStrikes < 7{
                    
                    print("")
                    print("PLEASE SELECT A LETTER")
                    guard var userChoice = readLine()?.lowercased() else {continue}
                    if userChoice.isEmpty {
                        print("LETTER NO ENTERED")
                        continue
                    }
                    let userChoseChar = Character(userChoice.lowercased())
                    if !alphabet.contains(userChoice){
                        print("WRONG INPUT, NO NUMBERS OR CHARACTERS")
                        continue
                    }
                    if alreadyChosen.contains(userChoice) {
                        print("LETTER WAS ALREADY CHOSEN!")
                        continue
                    } else if randomword.contains(userChoice){
                        for character in randomword{
                            switch character{
                            case userChoseChar:
                                correct += 1
                                rightLetter.append(userChoice)
                                alreadyChosen.append(userChoice)
                                
                            default:
                                continue
                            }
                            
                        }

                        
                        print("CORRECT!")
                        print("")
                        print("\(alreadyChosen)")
                        print("")
                        print("CORRECT: \(correct) || STRIKE: \(allowedStrikes)")
                        print("YOU HAVE \(7 - allowedStrikes) STRIKES LEFT")
                        print("")
                        
                    } else {
                        alreadyChosen.append(userChoice)
                        allowedStrikes += 1
                        if allowedStrikes == 1{
                            print(oneStrike)
                            print(alreadyChosen)
                        }
                        if allowedStrikes == 2{
                            print(twoStrikes)
                            print(alreadyChosen)
                        }
                        if allowedStrikes == 3{
                            print(threeStrikes)
                            print(alreadyChosen)
                        }
                        if allowedStrikes == 4{
                            print(fourStrikes)
                            print(alreadyChosen)
                        }
                        if allowedStrikes == 5{
                            print(fiveStrikes)
                            print(alreadyChosen)
                        }
                        if allowedStrikes == 6 {
                            print(sixStrikes)
                            print(alreadyChosen)
                        }
                        if allowedStrikes == 7 {
                            print(severStrikes)
                            print(alreadyChosen)
                        }
                        print("")
                        print("INCORRECT")
                        print("")
                        print("CORRECT: \(correct) || STRIKE: \(allowedStrikes)")
                        
                        print("")
                    }
                    
                    userChoice.append(Character(userChoice))
                    replacedString = ""
                    
                    for letter in randomword {
                        if rightLetter.contains(letter) {
                            replacedString += String(letter)
                        } else {
                            replacedString += "_"
                        }
                        replacedString += " "
                    }
                    
                    print(replacedString)
                    print("")
                    

            
                }
                if correct == randomword.count {
                    print("""
                        
                        🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿
                        🌿𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 🌿
                        🌿𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 🌿
                        🌿        YOU WON!...THE WORD WAS: \(randomword.uppercased())          🌿
                        🌿        IT TOOK YOU \(alreadyChosen.count) GUESSES TO GET IT         🌿
                        🌿𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 🌿
                        🌿𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 𝓐𝓵𝒾𝓿ℯ! 🌿
                        🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿🌿
                        
                        """)
                    continue
                } else {
                    
                    print("""
                        
                        🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
                        🔥𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡!!! 🔥
                        🔥𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡!!! 🔥
                        🔥          YOU LOOSE...THE WORD WAS: \(randomword.uppercased)           🔥
                        🔥          IT TOOK YOU \(alreadyChosen.count) GUESSES TO GET IT         🔥
                        🔥𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡!!! 🔥
                        🔥𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡! 𝔇𝔢𝔞𝔡!!! 🔥
                        🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
                        
                        
                        
                        """)
                    continue
                }
                    
                



            case 2:
                print("YOU CHICKEN 🐔")
                continue
            default:
                print("WRONG INPUT")
                continue
            }
        }
    }

    break
}


