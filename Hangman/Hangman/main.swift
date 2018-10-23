//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let saved: String = """
            ++++++++++++++++++++++++++++++++++++++
                        H A N G M A N
            ++++++++++++++++++++++++++++++++++++++

                    ================
                    || /           |
                    ||/            |
                    ||
                    ||
                    ||
                    ||                ..........
                    ||                . Thanks!.
                    ||              O ..........
                    ||           *--|--*
             *      ||     *        |         *
            *|*     ||  * *|*      | |       *|*
             |      ||  |  |       | |        |
            =======================================
"""

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
                    ||             O
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
                    ||             O
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
                    ||             O
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
                    ||             O
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
                    ||             O
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


let arrofWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

let initialMessage = """
********************************
        H A N G M A N
********************************

Do you want to help save a life?

Press [1] for Yes or [2] for No:

"""

let messagePlayAgain = """
********************************
        H A N G M A N
********************************

Should we try saving another life?

Press [1] for Yes or [2] for No:

"""



var userChoseToPlay = 1
var startGame = false
var playAgain = 0
var anotherGame = 0
var doYouWantToPlay: String? = ""

repeat {
    print(initialMessage)
    doYouWantToPlay = readLine()
    let userWantsToPlay = doYouWantToPlay ?? ("not a valid selection")
    if let userWantsToPlayInt = Int(userWantsToPlay){
        switch userWantsToPlayInt{
        case 1:
            startGame = true
        case 2:
            print ("What is another life...GOOD BYE!")
            print("")
            print("")
            break
        default:
            print("Not a valid entry. Please try again.")
            print("")
            print("")
            startGame = false
        }
    }
} while startGame == false && (userChoseToPlay != 1 || userChoseToPlay != 2)


while startGame == true {
    
    let randonWord = arrofWords.randomElement()
    let unwrappedRandomWord = randonWord ?? "no value"
    
    let randomWordArray = Array(unwrappedRandomWord)
    
    var arrayOfWrongLetters = [String]()
    
    
    let blanks = String(repeating: "_", count: unwrappedRandomWord.count)
    var blankArray = Array(blanks)
    
    let alphabet = """
        Letters to choose from:
        a, b, c, d, e, f, g, h, i, j, k, l, m,
        n, o, p, q, r, s, t, u, v, w, x, y, z
        """
    
    let gameSetUp = """
    
    \(blankArray)
    
    This is a \(unwrappedRandomWord.count) letter word
    
    \(alphabet)
    
    """
    
    var counterForGuesses = 0
    var indexLetterUserEnterUnwrapped = 0
    var countingFailedAttempts = 0
    
    print(gameSetUp)
    
    var userEnteredLetter: String = ""
    
    
    while countingFailedAttempts <= 6 {
        
        var unwrappingResponse = false
        
        while unwrappingResponse == false {
            print("Enter a letter: ")
            userEnteredLetter = readLine()?.lowercased() ?? "default"
            switch userEnteredLetter.lowercased() {
            case "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z":
                print("You entered: \"\(userEnteredLetter)\" ")
                counterForGuesses += 1
                unwrappingResponse = true
            default:
                print("Not a valid entry. Please try again.")
            }
        }
        
        let letterToCharacter:Character = Character(userEnteredLetter)
        
        if randomWordArray.contains(letterToCharacter){
            for (index, element) in randomWordArray.enumerated(){
                if letterToCharacter == element{
                    indexLetterUserEnterUnwrapped = index
                    blankArray[indexLetterUserEnterUnwrapped] = element
                }
                
            }
            
        } else if !randomWordArray.contains(letterToCharacter){
            countingFailedAttempts += 1
            arrayOfWrongLetters.append(String(userEnteredLetter))
            switch countingFailedAttempts{
                
            case 5:
                print(hangmanFive)
                print("This was attempt \(countingFailedAttempts) of 6 you have to save a life")
                print("")
                
                print("Wrong letters that kill: \(arrayOfWrongLetters)")
                print("")
                
            case 4:
                print(hangmanFour)
                print("This was attempt \(countingFailedAttempts) of 6 you have to save a life")
                print("")
                
                print("Wrong letters that kill: \(arrayOfWrongLetters)")
                print("")
                
            case 3:
                print(hangmanThree)
                print("This was attempt \(countingFailedAttempts) of 6 you have to save a life")
                print("")
                
                print("Wrong letters that kill: \(arrayOfWrongLetters)")
                print("")
                
            case 2:
                print(hangmanTwo)
                print("This was attempt \(countingFailedAttempts) of 6 you have to save a life")
                print("")
                
                print("Wrong letters that kill: \(arrayOfWrongLetters)")
                print("")
                
            case 1:
                print(hangmanFirst)
                print("This was attempt \(countingFailedAttempts) of 6 you have to save a life")
                print("")
                
                print("Wrong letters that kill: \(arrayOfWrongLetters)")
                print("")
                
            case 6:
                print(hangmanSix)
                print("A life is gooone.💀.💀.💀")
                print("")
                print("Wrong letters that kill: \(arrayOfWrongLetters)")
                print("")
                print ("The rigth word was: \(unwrappedRandomWord.uppercased())")
                print("")
                print("Not even with \(counterForGuesses) guesses could we save this human... oh well!")
                print("")
                
                countingFailedAttempts = 7
                startGame = false
            default:
                print("You are doneso... 👻")
            }
            
        } else {
            print("Not valid entry, please try again.")
        }
        print("Right letters that save lives: \(blankArray)")
        print("")
        if blankArray == randomWordArray {
            let finalGuessedWord = String(unwrappedRandomWord)
            print("")
            print(saved)
            print("")
            print("The correct word is: \(finalGuessedWord.uppercased())!")
            print("")
            print("🙌🏼🙌🏼 A person was saved thanks to you 🙌🏼🙌🏼")
            print("")
            print("It only took you \(counterForGuesses) guesses.")
            print("")
            countingFailedAttempts = 7
            startGame = false
        }
    }
    
    repeat {
        print(messagePlayAgain)
        doYouWantToPlay = readLine()
        let userWantsToPlay = doYouWantToPlay ?? ("Invalid input, please try again.")
        if let userWantsToPlayInt = Int(userWantsToPlay){
            switch userWantsToPlayInt{
            case 1:
                startGame = true
            case 2:
                print ("What is another life...GOOD BYE!")
                print("")
                print("")
                
                break
            default:
                print("Not a valid entry. Please try again.")
                startGame = false
            }
        }
    } while startGame == false && (userChoseToPlay != 1 || userChoseToPlay != 2)
}
