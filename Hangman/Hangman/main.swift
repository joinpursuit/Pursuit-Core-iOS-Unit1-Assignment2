//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
var gallow =
"""
///////////////
/------------ /
/|         |  /
/|            /
/|            /
/|            /
///////////////
"""
var gallowAgain =
"""
///////////////
/------------ /
/|         |  /
/|            /
/|            /
/|            /
///////////////
"""
let face = "O"
let body = "|"
let rightArm = "\\"
let leftArm = "/"
let rightLeg = "\\"
let leftLeg = "/"
let faceIndex = gallow.index(gallow.startIndex, offsetBy: 59)
let bodyIndex = gallow.index(gallow.endIndex, offsetBy: -36)
let rightArmIndex = gallow.index(gallow.endIndex, offsetBy: -35)
let leftArmIndex = gallow.index(gallow.endIndex, offsetBy: -37)
let rightLegIndex = gallow.index(gallow.endIndex, offsetBy: -19)
let leftLegIndex = gallow.index(gallow.endIndex, offsetBy: -21)

var tryAgain = true
var loopGuess = true
var loopOver = true
var loopChoice = true
var solve = ""
var strikeString = ""
var strike = 0
var foundIndex = -1
var guessCount = 0

repeat {
    if let choice = allTheWords.randomElement() {
        print(choice) // REMEMBER TO REMOVE BEFORE SUBMITTING!!!!!
        print("let's play hangman!")
        print("your target word has \(choice.count) letters")
        for _ in choice {
            solve += "_"
        }
        while loopGuess {
            print(solve)
            print(gallow)
            print("guess a letter")
            //sometimes valid letters are counted as not valid
            if let guess = readLine()?.lowercased() {
                print("you guessed \(guess).")
                if guess >= "a" && guess <= "z" && !strikeString.contains(guess) && guess.count == 1 {
                    if strike != 6 {
                        if choice.contains(guess) {
                            print("that's correct!")
                            guessCount += 1
                            strikeString.append(guess)
                            for (index, char) in choice.enumerated() {
                                let letter = Character(guess)
                                if char == letter {
                                    foundIndex = index
                                    let stringIndex = solve.index(solve.startIndex, offsetBy: foundIndex)
                                    solve.remove(at: stringIndex)
                                    solve.insert(letter, at: stringIndex)
                                }
                            }
                            if solve == choice {
                                print("You solved it! Your word was \(choice)!")
                                print("It took you \(guessCount) valid guesses to solve it!")
                                while loopChoice {
                                    print("Would you like to play again? yes or no")
                                    if let win = readLine()?.lowercased() {
                                        switch win {
                                        case "yes":
                                            print("yes")
                                            loopGuess = false
                                            loopChoice = false
                                        case "no":
                                            loopGuess = false
                                            loopChoice = false
                                            tryAgain = false
                                        default:
                                            print("That is not a vaild answer")
                                        }
                                    }
                                }
                                
                            }
                        } else {
                            print("sorry that's a strike.")
                            guessCount += 1
                            strike += 1
                            strikeString.append(guess)
                            switch strike {
                            case 1:
                                gallow.remove(at: faceIndex)
                                gallow.insert(contentsOf: face, at: faceIndex)
                            case 2:
                                gallow.remove(at: bodyIndex)
                                gallow.insert(contentsOf: body, at: bodyIndex)
                            case 3:
                                gallow.remove(at: rightArmIndex)
                                gallow.insert(contentsOf: rightArm, at: rightArmIndex)
                            case 4:
                                gallow.remove(at: leftArmIndex)
                                gallow.insert(contentsOf: leftArm, at: leftArmIndex)
                            case 5:
                                gallow.remove(at: rightLegIndex)
                                gallow.insert(contentsOf: rightLeg, at: rightLegIndex)
                            default:
                                print("")
                            }
                        }
                    } else {
                        gallow.remove(at: leftLegIndex)
                        gallow.insert(contentsOf: leftLeg, at: leftLegIndex)
                        print(gallow)
                        print("That's 6 strikes! Game over.")
                        print("Your word was \(choice). You made \(guessCount) valid guesses.")
                        while loopOver {
                            print("would you like to try again? yes or no")
                            if let lose = readLine()?.lowercased() {
                                switch lose {
                                case "yes":
                                    gallow = gallowAgain
                                    loopGuess = false
                                    loopOver = false
                                    
                                case "no":
                                    tryAgain = false
                                    loopGuess = false
                                    loopOver = false
                                default:
                                    print("That is not a vaild answer")
                                }
                            }
                        }
                    }
                } else {
                    print("That is not a valid guess.")
                }
            }
        }
    }
    solve = ""
    strike = 0
    guessCount = 0
    loopGuess = true
    loopChoice = true
    loopOver = true
} while tryAgain
print("thanks for playing!")

// do we need to count invalid guesses for the total of guesses at the end?
