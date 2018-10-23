////
//  main.swift
//  Hangman
//
//


import Foundation

print("HANGMAN!")

var wordBank =  ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]
var wins = 0
var losses = 0
var numberOfWrongGuess = 0 // number of guesses player got wrong. game ends when wrong guess reaches 5 attempts
var allGuesses = Set<Character>() // all guesses made by the player
var guessesLeft = 6 // number of guesses left for the player to use
var answer = "" // the player's word input as an answer
var guess: Character = " " // the letter entered by the player
var gameInProgress = true // whether the game is in progress or not
var hiddenWord = "" // length of countElement (hiddenWord)
var randomWord = wordBank.randomElement()!
var userFoundLetter = false
let hangmanArt = """
_________
|         |
|         0
|        /|\\
|        / \\
|
|
"""

for _ in randomWord {
    hiddenWord.append("_")
}

print(hiddenWord)
while gameInProgress {
    //print("The random word is \(randomWord)")
    print("Guess a letter")
    if let playerGuessResponse = readLine() {
        if playerGuessResponse.count == 1 { // number of times player guesses
            

            let userLetter = Character(playerGuessResponse)
            //Check if letter was already used
            if allGuesses.contains(userLetter) {
                print("letter already used")
                continue
            }
            //Add new character to set
            allGuesses.insert(userLetter)
            
            // check if letter is in the random word
            // save indexes where character was found
            var foundIndexes = [Int]()
            for (index, letter) in randomWord.enumerated() {
                if letter == userLetter {
                    print("letter \(letter) is in the random word at index \(index)")
                    foundIndexes.append(index)
                    userFoundLetter = true
                }
            }
            
            // update mask word
            for index in foundIndexes {
                let currentIndex = hiddenWord.index(hiddenWord.startIndex, offsetBy: index)
                hiddenWord.remove(at: currentIndex)
                hiddenWord.insert(userLetter, at: currentIndex)
            }
            
            //If user didn't guess letter decrement guesses left
            if userFoundLetter == false {
                guessesLeft -= 1
                print("You have \(guessesLeft) guess left")
            } else {
                //Set to false if user found letter
                userFoundLetter = false
            }
            
            if guessesLeft == 0 {
                print("you lose")
                print(hangmanArt)
                print("do you want to play again?")
                let playerRetry = readLine()
                if playerRetry == "yes" {
                    //If user chose yes, reset game
                    randomWord = wordBank.randomElement()!
                    hiddenWord = ""
                    for _ in randomWord {
                        hiddenWord.append("_")
                    
                    }
                    guessesLeft = 6
                    userFoundLetter = false
                    allGuesses = Set<Character>()
                    continue
                } else {
                    print("Thanks for playing hangman")
                    gameInProgress = false
                    break
                }
            }
            
            if hiddenWord == randomWord {
                print("you won!")
                print("would you like to play again?")
                let playerRetry = readLine()
                if playerRetry == "yes" {
                    //If user chose yes, reset game
                    randomWord = wordBank.randomElement()!
                    hiddenWord = ""
                    for _ in randomWord {
                        hiddenWord.append("_")
                    }
                    guessesLeft = 6
                    allGuesses = Set<Character>()
                    continue
                } else {
                    print("🏆 Congratulations, you've won")
                    gameInProgress = false
                }
            }
            
            print("current word guess is \(hiddenWord)")
        } else {
            print("enter a valid character")
        }
    }
}
