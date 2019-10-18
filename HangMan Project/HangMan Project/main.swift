//
//  main.swift
//  HangMan Project
//
//  Created by Margiett Gil on 10/9/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation
print("Welcome to Hangman ! ")
sleep(2)
print("Lets Guess the Word !!")
sleep(2)
let allTheWords = [
    "able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var randomWord = allTheWords.randomElement() ?? "apple"
var gappedWord = [Character]()

for _ in 1...randomWord.count {
    gappedWord.append("_")
   
}
// print(gappedWord)

print(randomWord)

sleep(2)
var gueses = [String]()

var keepgoing = true

print("Guessing time 🧐")

var numberOfAttemps = 6
print()


repeat{
    
    print(String(gappedWord))
    print()
    
    let usersLetter = readLine()?.lowercased() ?? "a"

  
if randomWord.contains(Character(usersLetter)){
    
       
//    print("corect")
    
    //subscripted
    //element
    
    for (index,letter) in randomWord.enumerated() {
       if letter == Character(usersLetter){
        gappedWord [index] = Character(usersLetter)
        
        }
    }
    
    
    if randomWord == String(gappedWord) {
              
              print("winner 🥳🤩")
        let multilineString = """
               YYYYYYY       YYYYYYY                             WWWWWWWW                           WWWWWWWW
               Y:::::Y       Y:::::Y                             W::::::W                           W::::::W
               Y:::::Y       Y:::::Y                             W::::::W                           W::::::W
               Y::::::Y     Y::::::Y                             W::::::W                           W::::::W
               YYY:::::Y   Y:::::YYYooooooooooo   uuuuuu    uuuuuuW:::::W           WWWWW           W:::::W ooooooooooo   nnnn  nnnnnnnn
                  Y:::::Y Y:::::Y oo:::::::::::oo u::::u    u::::u W:::::W         W:::::W         W:::::Woo:::::::::::oo n:::nn::::::::nn
                   Y:::::Y:::::Y o:::::::::::::::ou::::u    u::::u  W:::::W       W:::::::W       W:::::Wo:::::::::::::::on::::::::::::::nn
                    Y:::::::::Y  o:::::ooooo:::::ou::::u    u::::u   W:::::W     W:::::::::W     W:::::W o:::::ooooo:::::onn:::::::::::::::n
                     Y:::::::Y   o::::o     o::::ou::::u    u::::u    W:::::W   W:::::W:::::W   W:::::W  o::::o     o::::o  n:::::nnnn:::::n
                      Y:::::Y    o::::o     o::::ou::::u    u::::u     W:::::W W:::::W W:::::W W:::::W   o::::o     o::::o  n::::n    n::::n
                      Y:::::Y    o::::o     o::::ou::::u    u::::u      W:::::W:::::W   W:::::W:::::W    o::::o     o::::o  n::::n    n::::n
                      Y:::::Y    o::::o     o::::ou:::::uuuu:::::u       W:::::::::W     W:::::::::W     o::::o     o::::o  n::::n    n::::n
                      Y:::::Y    o:::::ooooo:::::ou:::::::::::::::uu      W:::::::W       W:::::::W      o:::::ooooo:::::o  n::::n    n::::n
                   YYYY:::::YYYY o:::::::::::::::o u:::::::::::::::u       W:::::W         W:::::W       o:::::::::::::::o  n::::n    n::::n
                   Y:::::::::::Y  oo:::::::::::oo   uu::::::::uu:::u        W:::W           W:::W         oo:::::::::::oo   n::::n    n::::n
                   YYYYYYYYYYYYY    ooooooooooo       uuuuuuuu  uuuu         WWW             WWW            ooooooooooo     nnnnnn    nnnnnn
               """
               print(multilineString)

        break
          
         }
    
    print(randomWord,String(gappedWord))
} else {
    
 numberOfAttemps -= 1

    print(numberOfAttemps)
    if numberOfAttemps == 0 {
        print("You Lost !! 😟☹️")
        keepgoing = false
        let multilineString = """
        `8.`8888.      ,8'  ,o888888o.     8 8888      88 8 8888         ,o888888o.       d888888o. 8888888 8888888888
        `8.`8888.    ,8'. 8888     `88.   8 8888      88 8 8888      . 8888     `88.   .`8888:' `88.     8 8888
         `8.`8888.  ,8',8 8888       `8b  8 8888      88 8 8888     ,8 8888       `8b  8.`8888.   Y8     8 8888
          `8.`8888.,8' 88 8888        `8b 8 8888      88 8 8888     88 8888        `8b `8.`8888.         8 8888
           `8.`88888'  88 8888         88 8 8888      88 8 8888     88 8888         88  `8.`8888.        8 8888
            `8. 8888   88 8888         88 8 8888      88 8 8888     88 8888         88   `8.`8888.       8 8888
             `8 8888   88 8888        ,8P 8 8888      88 8 8888     88 8888        ,8P    `8.`8888.      8 8888
              8 8888   `8 8888       ,8P  ` 8888     ,8P 8 8888     `8 8888       ,8P 8b   `8.`8888.     8 8888
              8 8888    ` 8888     ,88'     8888   ,d8P  8 8888      ` 8888     ,88'  `8b.  ;8.`8888     8 8888
              8 8888       `8888888P'        `Y88888P'   8 888888888888 `8888888P'     `Y8888P ,88P'     8 8888
        """
        print(multilineString)

    }

}
    
    print()

} while keepgoing

