//
//  main.swift
//  Hangman
//
//  Created by Cameron Rivera on 10/8/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

func printInfo(remaining rg: Int) -> Void {
    var gallows = """

"""
    switch rg{
        case 6:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
        case 5:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |          www
                        |         w   w
                        |         w   w
                        |          www
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
        case 4:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |          www
                        |         w   w
                        |         w   w
                        |          www
                        |           w
                        |           w
                        |           w
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
        case 3:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |          www
                        |         w   w
                        |         w   w
                        |          www
                        |      w    w
                        |        w  w
                        |          ww
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
        case 2:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |          www
                        |         w   w
                        |         w   w
                        |          www
                        |      w    w    w
                        |        w  w  w
                        |          www
                        |
                        |
                        |
                        |
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
        case 1:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |          www
                        |         w   w
                        |         w   w
                        |          www
                        |      w    w    w
                        |        w  w  w
                        |          www
                        |           w
                        |         w
                        |       w
                        |     w
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
        default:
            gallows = """
                        _____________
                        |           |
                        |           |
                        |           |
                        |          www
                        |         w   w
                        |         w   w
                        |          www
                        |      w    w    w
                        |        w  w  w
                        |          www
                        |           w
                        |         w   w
                        |       w       w
                        |     w           w
                        |
                        |
                        |
                    ---------
            """
            print(gallows)
    }
    
}


let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var desireToPlay: String = " "

print("Would you like to play a game of Hangman? Enter y for yes, and n for no: ",terminator: "")
desireToPlay = readLine() ?? ""
desireToPlay = desireToPlay.lowercased()

while(desireToPlay != "y" && desireToPlay != "n"){
    print("Enter either y to play a game of hangman, or n to not play: ",terminator: "")
    desireToPlay = readLine() ?? ""
    desireToPlay = desireToPlay.lowercased()
}


if desireToPlay == "y"{
     while(desireToPlay == "y"){
        let selectedWord = allTheWords.randomElement() ?? ""
        var guessedLetters: Set<Character> = []
        var remainingGuesses: Int = 6
        var guess: String = ""
        var correctGuess: Bool = false
        var won = false
        var totalGuesses = 0
        
        while(remainingGuesses > 0 && !won){
            
            won = true
            printInfo(remaining: remainingGuesses)
            print("You have \(remainingGuesses) guesses left before you are hanged.")
            print("These are the letters you have already guessed: \(guessedLetters).")
            
            for char in selectedWord{
                if(guessedLetters.contains(char)){
                    print(char,terminator:"")
                } else {
                    print("_",terminator:"")
                }
            }
            
            print()
            print("Guess a letter: ",terminator: "")
            guess = readLine() ?? ""
            guess = guess.lowercased()
            
            while(guess.count != 1 || guessedLetters.contains(Character(guess)) || !Character(guess).isLetter){
                if(guess.count != 1){
                    print("\(guess) is not a valud input. Please input a character: ", terminator: " ")
                    guess = readLine() ?? ""
                    guess = guess.lowercased()
                }else if(!Character(guess).isLetter){
                    print("Please input a letter of the alphabet, no numbers, punctuation, etc.", terminator: "")
                    guess = readLine() ?? ""
                    guess = guess.lowercased()
                } else if(Character(guess).isLetter && guessedLetters.contains(Character(guess))){
                    print("You have already guessed the following letters \(guessedLetters)")
                    print("Please select a letter that you have not already guessed: ", terminator: "")
                    guess = readLine() ?? ""
                    guess = guess.lowercased()
                }
            }
            
            guessedLetters.insert(Character(guess))
            totalGuesses += 1
        
            for char in selectedWord{
                if(char == Character(guess)){
                    correctGuess = true
                }
            }
        
            if(!correctGuess){
                remainingGuesses -= 1
            }

            correctGuess = false
            
            for char in selectedWord{
                if(!guessedLetters.contains(char)){
                    won = false
                }
            }
        }
        
        if !won {
            printInfo(remaining: 0)
            print("You have lost, which in this game means that you have earned your death by hanging.")
            print("The correct word was: \(selectedWord)")
        } else {
            print("It took you \(totalGuesses) guesses to win. You did it! You have avoided death by hanging......what a morbid game.")
        }
        
        repeat{
            print("Would you like to play again? Enter y to play again or n to quit: ",terminator: "")
            desireToPlay = readLine() ?? ""
            desireToPlay = desireToPlay.lowercased()
        }while(desireToPlay != "y" && desireToPlay != "n")
    }
    print("Thank you for playing.")
} else {
    print("Goodbye")
}
