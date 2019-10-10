//
//  main.swift
//  HangManChristianHurtado
//
//  Created by Christian Hurtado on 10/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//
import Foundation

print("Welcome to Hangman!!! 😈😈😈😈😈😈")
sleep(1)
print("Typically, execution is not a celebrated experience but we're always eager to play this morbid game")
sleep(1)
print("The rules are simple: guess the letters of a random word correctly and win!")
sleep(2)
print("If you guess wrong within the alotted amount of limbs, your player will be lynched! 😢 😵 ⚰️")
sleep(3)

var response:String
repeat{
print("READY TO PLAY, 'yes' or 'no'?")
response = readLine() ?? ""
} while response != "yes"

print("Great, let's go die...I mean not...die....😈")
sleep(1)
print("You will have a minimum of 6 opportunities to guess the correct letters in the word. For each wrong guess, a body part will be added until a full body has been completed. (Head, Torso, 2 Legs, and 2 Arms)")
//sleep(2)
print("Let's play!")
print("""
 +---+
  |   |
      |
      |
      |
      |
=========
""")

var allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young", "CodingIsHard", "iDefinitelydidntcrywhilemakingthisgame"]

//allTheWords.shuffle()
//
//print(allTheWords)
var attemptsLogged = 6
let randomWord = allTheWords.randomElement() ?? ""
var wrongGuesses = ""
var alphabet = Array("abcdefghijklmnopqrstuvwxyz")

var actualWord = Array(randomWord)

var maskedWordUnderscores = Array(String(repeating: "_", count: randomWord.count))

print(String(maskedWordUnderscores))

var reapeatCondition = true

repeat{
    print("Incorrect guesses: \(wrongGuesses)")
    let guess = Array(readLine() ?? "")
    if alphabet.contains(guess[0]) {
        continue
    } else{
        print("Sorry! Only letters!")
    }
    
    if wrongGuesses.contains(guess[0]){
        print("Oh no, you already guessed that letter, try again!")
    } else {
        print("keep going!")
        
     if actualWord.contains(guess[0]) {
         for (index, character) in actualWord.enumerated() {
             if character == guess[0] {
                 maskedWordUnderscores[index] = character
         }
     }
 if maskedWordUnderscores == (actualWord) {
         print("YAY!") // add text art that's congratulating the player for winning the game! and potentially offer a repeat loop to play new game with new random word
     
     reapeatCondition = false
     }
      print(String(maskedWordUnderscores))
         } else {
         wrongGuesses += String(guess[0])
         attemptsLogged -= 1
         print("Sorry, Incorrect! You have \(attemptsLogged) chances left!")
         if attemptsLogged == 5{
         print("""
                 +---+
                   |   |
                   O   |
                       |
                       |
                       |
                 =========
 """)
             print(String(maskedWordUnderscores))
         }
         if attemptsLogged == 4{
             print("""
                  +---+
                   |   |
                   O   |
                   |   |
                       |
                       |
                 =========
 """)
             print(String(maskedWordUnderscores))
         }
         if attemptsLogged == 3{
             print("""
                     +---+
                       |   |
                       O   |
                     --|   |
                           |
                           |
                     =========
 """)
             print(String(maskedWordUnderscores))
         }
         if attemptsLogged == 2{
             print("""
                      +---+
                       |   |
                       O   |
                     --|-- |
                           |
                         =========
                 """)
             print(String(maskedWordUnderscores))
         }
         if attemptsLogged == 1{
             print("""
                     +---+
                       |   |
                       O   |
                     --|-- |
                      [    |
                     =========
                 """)
             print(String(maskedWordUnderscores))
         }
         if attemptsLogged == 0{
             print("""
                     GAME OVER!!!!!!
                   +---+
                   |   |
                   O   |
                 --|-- |
                  [ ]  |
                 =========
 """)
             print("Oh no! The word was: \(String(actualWord)) !")
             break
             }
         }
 }
} while reapeatCondition
 print("Do you want to play again?!")

 var playAgain = readLine() ?? "yes"
