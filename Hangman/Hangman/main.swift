//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
var playResponse = ""
repeat  {
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var enteredLetters : [String] = []
var remains = ""

var cpuWord = "", hiddenWord = "", updatedWord = "", currentWord = ""
var bodyPartsLeft = 6, index = 0, updatedBodyParts = 6
var guess = true, entered = false, guessedRight = true, gameOver = false

let lastIndex = allTheWords.count - 1, firstIndex = 0
let randomIndex = Int.random(in: firstIndex...lastIndex)
let randomWord = allTheWords[randomIndex]
let randomWordArray = randomWord.components(separatedBy: "")
let blankSpace = "_"

var alphabet = "a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z"
var currentAlphabet = ""

//Intro phrases
let greeting = "Welcome to Hangman, where if you do not guess the right word in time...YOU HANG!"
let hangmanPicking = "Wait while the HangMan chooses a word..."
let explanation = "Guess a letter that's in the word till' the word is complete to win, guess wrong \(bodyPartsLeft) times and you're hanged!"
var chancesLeftScript = "You have \(bodyPartsLeft) body parts left"

cpuWord = randomWord

//See if can refactor this to use .contains()
func guessOutput(enteredLetter : String) -> Bool   {
    if cpuWord.contains(enteredLetter) {
            guess = true
    }
        else {guess = false}
    
    return guess
}

func updateRight(enteredLetter : String) -> String {
    for char in cpuWord {
        if char == Character(enteredLetter)    {
            let startIndex = hiddenWord.startIndex
            let offset = hiddenWord.index(startIndex, offsetBy: index)
            hiddenWord.remove(at: offset)
            hiddenWord.insert(Character(enteredLetter), at: offset)
            updatedWord = hiddenWord
            index += 2
        }
        else    {index += 2}
    }
    index = 0
    return updatedWord
}

func updateWrong() -> String {
    updatedWord = hiddenWord
    return updatedWord
}

func enteredLetterBucket(enteredLetter : String) -> [String]   {
    enteredLetters.append(enteredLetter)
    let noDuplicates = Set(enteredLetters)
    enteredLetters = Array(noDuplicates).sorted()
    return enteredLetters
}

func checkAlreadyEntered(enteredLettersArray : [String], enteredLetter : String) -> Bool  {
    if enteredLettersArray.contains(enteredLetter)  {
        entered = true
    }
    else    {entered = false}
    return entered
}

func remainingAlphabet(enteredLetter : String, alph : String) -> String    {
    if alph.contains(enteredLetter) {
        currentAlphabet = alph.replacingOccurrences(of: enteredLetter, with: " ")
    }
    return currentAlphabet //string, contains, removeoccurrences
}

func checkWordComplete(checkWord : String, soFarWord : String) -> Bool    {
    var count = 0
    var complete = false
    for char in checkWord {
        if soFarWord.contains(char)   {
            count += 1
        }
    }
    if count == checkWord.count {
        complete = true
    }
    else {complete = false}
    return complete
}

func updateBodyParts(guess : Bool) -> Int  {
    if guess == false   {
        updatedBodyParts -= 1
    }
    return updatedBodyParts
}


print(greeting + "\n")
print(hangmanPicking + "\n")
print(explanation + "\n")

//print starting board
for _ in cpuWord {
    hiddenWord += (blankSpace) + " "
}

print(hiddenWord + "\n")
print("\n" + alphabet)


//start loop after intro print for single game
//loop whole thing for play again

repeat  {
let userGuess = String(readLine() ?? "")
guess = guessOutput(enteredLetter: userGuess)

//var remainingLetters = remainingAlphabet(enteredLetter: userGuess) //move adjust

    let alreadyEntered = checkAlreadyEntered(enteredLettersArray: enteredLetters, enteredLetter: userGuess) //check print

bodyPartsLeft = updateBodyParts(guess: guess)
    
if alreadyEntered == true   {
    print("Already entered letter")
    print("\n" + currentWord + "\n")
    print("You have \(bodyPartsLeft) body parts left")
    print("Used Letters: \(enteredLetters)")
    alphabet = remainingAlphabet(enteredLetter: userGuess, alph: alphabet)
    print("Remaining Letters: \(alphabet)\n")
}

else if guess == guessedRight    {
    currentWord = updateRight(enteredLetter: userGuess)
    enteredLetters = enteredLetterBucket(enteredLetter: userGuess)
    print("\n" + currentWord + "\n")
    print("You have \(bodyPartsLeft) body parts left")
    print("Used Letters: \(enteredLetters)")
    alphabet = remainingAlphabet(enteredLetter: userGuess, alph: alphabet)
    print("Remaining Letters: \(alphabet)\n")
    if checkWordComplete(checkWord: cpuWord, soFarWord: currentWord) == true    {
        print("You Win!")
        print(cpuWord)
        gameOver = true
    }
    //store used alphabet letters
    //print remaining alphabet
    //check if word completed or out of chances to end game
}
    
else    {
    currentWord = updateWrong()
    enteredLetters = enteredLetterBucket(enteredLetter: userGuess)
    print("\n" + currentWord + "\n")
    print("You have \(bodyPartsLeft) body parts left")
    print("Used Letters: \(enteredLetters)")
    alphabet = remainingAlphabet(enteredLetter: userGuess, alph: alphabet)
    print("Remaining Letters: \(alphabet)\n")
    if bodyPartsLeft == 0   {
        print("You Lose")
        print(cpuWord)
        gameOver = true
    }
}
}  while gameOver == false

print("Play Again? (y for Yes, n for No)")
    playResponse = readLine() ?? ""
} while playResponse == "y"
//print(cpuWord)
//isLetter
/*
var testStr = "hello"
var startIndex = testStr.startIndex
var offset = testStr.index(startIndex, offsetBy: 2)
testStr.remove(at: offset)
testStr.insert("p", at: offset)
print(testStr)
*/
//optionals

