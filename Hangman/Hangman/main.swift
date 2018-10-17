//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
//loop ____ if letter is in word replace _ with letter. print new ____. if _ in _a_h_ then do code else "you solved it!
//var tryAgain = true
//var loopGuess = true
//var solve = ""
//var strikeString = ""
//var strike = 0
//var foundIndex = -1
//// The word that the computer chooses must be random. There is a large array of words below.
//// after guess if letter is wrong say that's a strike. if correct update solve
//repeat {
//    if let choice = allTheWords.randomElement() {
//        print(choice)
//        print("let's play hangman!")
//        print("your target word has \(choice.count) letters")
//        for _ in choice {
//            solve += "_"
//        }
//        while loopGuess {
//            print("Strikes: \(strike) out of 6")
//            print(solve)
//            print("guess a letter")
//            if let guess = readLine()?.lowercased() {
//                print("you guessed \(guess).")
//                if guess >= "a" && guess <= "z" && !strikeString.contains(guess) {
//                    if strike < 5 {
//                        if choice.contains(guess) {
//                            print("that's correct!")
//                            for (index, char) in choice.enumerated() {
//                                let letter = Character(guess)
//                            //    print("index: \(index), char: \(char)")
//                                if char == letter {
//                                    foundIndex = index
//                                    let stringIndex = solve.index(solve.startIndex, offsetBy: foundIndex)
//                                    solve.remove(at: stringIndex)
//                                    solve.insert(letter, at: stringIndex)
//                                }
//                            }
//                            if solve == choice {
//                                print("You solved it! Your word was \(choice)!")
//                                print("You win! Congrats!")
//                                print("Would you like to play again? yes or no")
//                                if let win = readLine()?.lowercased() {
//                                    switch win {
//                                    case "yes":
//                                        print("yes")
//                                        loopGuess = false
//                                    case "no":
//                                        loopGuess = false
//                                        tryAgain = false
//
//                                    // break
//                                    default:
//                                        print("not a vaild answer")
//                                    }
//                                }
//                            }
//                        } else {
//                            print("sorry that's a strike.")
//                            strike += 1
//                            strikeString.append(guess)
//                        }
//                    } else {
//                        print("That's 6 strikes! Game over.")
//                        print("would you like to try again? yes or no")
//                        if let lose = readLine()?.lowercased() {
//                            switch lose {
//                            case "yes":
//                                print("yes")
//                                loopGuess = false
//                            case "no":
//                                tryAgain = false
//                                loopGuess = false
//                               // break
//                            default:
//                                print("not a vaild answer")
//                            }
//                        }
//                    }
//                } else {
//                    print("that is not a valid guess.")
//                }
//            }
//        }
//    }
//    solve = ""
//    strike = 0
//    loopGuess = true
//} while tryAgain
//print("thanks for playing!")

let hangmanFirst = "----------"
let hangmanSecond = "|        |"
let hangmanThird = "|          "
let hangmanFourth = "|          "
let hangmanFifth = "|          "
let hangmanLast = "|          "
let total = [hangmanFirst, hangmanSecond, hangmanThird, hangmanFourth, hangmanLast]

print(total, terminator: " ")
var whole =
"""
------------
|         ||
|
|
|
"""
let face = "         😕"
let body = "         🥋"
let faceIndex = whole.index(whole.startIndex, offsetBy: 27)
let bodyIndex = whole.index(whole.endIndex, offsetBy: -4)

//print("Second line: \(substring)")
whole.insert(contentsOf: face, at: faceIndex)
print(whole)
whole.insert(contentsOf: body, at: bodyIndex)
print(whole)


// --- Multi-line string literal Mutation ---

// Creating Substring
//var mutableMultiLineString = """
//Hello AgnosticDev!
//I really enjoy tutorials.
//Especially Swift Tutorials!
//"""
//let startingIndex = mutableMultiLineString.index(mutableMultiLineString.startIndex, offsetBy: 19)
//let endingIndex = mutableMultiLineString.index(mutableMultiLineString.startIndex, offsetBy: 44)
//let range = startingIndex..<endingIndex
//let substring = mutableMultiLineString.substring(with: range)
//print("Second line: \(substring)")
//
//
//
//// Replacing Values
//let replacedString = mutableMultiLineString.replacingOccurrences(of: " ", with: "\n")
//print("Replaced value string: \(replacedString)")
