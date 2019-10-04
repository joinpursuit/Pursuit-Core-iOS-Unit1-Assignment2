//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var count = 0
var visualWord: [Character] = []
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

func hangmanImage() {
    if count == 1 {
        print("""
         ___________.._______
        | .__________))______|
        | | / /      ||
        | |/ /       ||
        | | /        ||.-''.
        | |/         |/  _  \\
        | |          ||  `/,|
        | |          (\\\\`_.'
        | |
        | |
        | |
        | |
        | |
        | |
        | |
        | |
        | |
        | |
        \"\"\"\"\"\"\"\"\"\"|_`-' `-' |"\"\"
        |\"|\"\"\"\"\"\"\"\\       '\"|\"|
        | |        \\\\        | |
        : :         \\\\       : :
        . .          `'       . .

        """)
    } else if count == 2 {
        print("""
         ___________.._______
        | .__________))______|
        | | / /      ||
        | |/ /       ||
        | | /        ||.-''.
        | |/         |/  _  \\
        | |          ||  `/,|
        | |          (\\\\`_.'
        | |         .-`--'.
        | |          |. .|
        | |          |   |
        | |          | . |
        | |          |   |
        | |           - -
        | |
        | |
        | |
        | |
        \"\"\"\"\"\"\"\"\"\"|_`-' `-' |"\"\"
        |\"|\"\"\"\"\"\"\"\\       '\"|\"|
        | |        \\\\        | |
        : :         \\\\       : :
        . .          `'       . .

        """)
    } else if count == 3 {
        print("""
         ___________.._______
        | .__________))______|
        | | / /      ||
        | |/ /       ||
        | | /        ||.-''.
        | |/         |/  _  \\
        | |          ||  `/,|
        | |          (\\\\`_.'
        | |         .-`--'.
        | |           . . Y\\
        | |          |   | \\\\
        | |          | . |  \\\\
        | |          |   |   (`
        | |           - -
        | |
        | |
        | |
        | |
        \"\"\"\"\"\"\"\"\"\"|_`-' `-' |"\"\"
        |\"|\"\"\"\"\"\"\"\\       '\"|\"|
        | |        \\\\        | |
        : :         \\\\       : :
        . .          `'       . .

        """)
    } else if count == 4 {
        print("""
         ___________.._______
        | .__________))______|
        | | / /      ||
        | |/ /       ||
        | | /        ||.-''.
        | |/         |/  _  \\
        | |          ||  `/,|
        | |          (\\\\`_.'
        | |         .-`--'.
        | |        /Y . . Y\\
        | |       // |   | \\\\
        | |      //  | . |  \\\\
        | |     ')   |   |   (`
        | |           - -
        | |
        | |
        | |
        | |
        \"\"\"\"\"\"\"\"\"\"|_`-' `-' |"\"\"
        |\"|\"\"\"\"\"\"\"\\       '\"|\"|
        | |        \\\\        | |
        : :         \\\\       : :
        . .          `'       . .

        """)
    } else if count == 5 {
        print("""
         ___________.._______
        | .__________))______|
        | | / /      ||
        | |/ /       ||
        | | /        ||.-''.
        | |/         |/  _  \\
        | |          ||  `/,|
        | |          (\\\\`_.'
        | |         .-`--'.
        | |        /Y . . Y\\
        | |       // |   | \\\\
        | |      //  | . |  \\\\
        | |     ')   |   |   (`
        | |          ||-
        | |          ||
        | |          ||
        | |          ||
        | |         / |
        \"\"\"\"\"\"\"\"\"\"|_`-' `-' |"\"\"
        |\"|\"\"\"\"\"\"\"\\       '\"|\"|
        | |        \\\\        | |
        : :         \\\\       : :
        . .          `'       . .

        """)
    } else if count == 6 {
        print("""
 ___________.._______
| .__________))______|
| | / /      ||
| |/ /       ||
| | /        ||.-''.
| |/         |/  _  \\
| |          ||  `/,|
| |          (\\\\`_.'
| |         .-`--'.
| |        /Y . . Y\\
| |       // |   | \\\\
| |      //  | . |  \\\\
| |     ')   |   |   (`
| |          ||-||
| |          || ||
| |          || ||
| |          || ||
| |         / | | \\
\"\"\"\"\"\"\"\"\"\"|_`-' `-' |"\"\"
|\"|\"\"\"\"\"\"\"\\       '\"|\"|
| |        \\\\        | |
: :         \\\\       : :
. .          `'       . .

""")
    }
}

func reStart() {
    print()
    print()
    print()
    print("Would you like to play again?")
    print("Yes/No")
    let reStart = readLine()?.lowercased() ?? "no"
    
    if reStart == "yes" {
        space()
        hangman(randomWord())
    } else {
        print("Good Bye")
    }
}

func space() {
    for _ in 1..<71 {
        print()
    }
}

func randomWord() -> String  {
    return allTheWords.randomElement() ?? "Word does not exist"
}

func printVisualWord() {
    for letter in visualWord {
        print(letter, terminator: " ")
    }
    print()
}

func hangman(_ word: String) {
    var lettersLeft = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
    
    for _ in word {
        visualWord.append("_")
    }
    
    while count != 6 {
        printVisualWord()
        
        let userInput1 = readLine()?.lowercased() ?? "1"
        
        if userInput1.count > 1 {
            space()
            print("please enter \"ONE LETTER\" no numbers are allowed as well")
            sleep(2)
            space()
            hangmanImage()
            print("below will be the unused letter list")
            print(lettersLeft.uppercased())
            continue
        }
        
        if word.contains(userInput1) {
            for (wordIndex, letter) in word.enumerated() where word.contains(userInput1) {
                if letter == Character(userInput1) {
                    visualWord[wordIndex] = Character(userInput1)
                }
            }
            space()
        } else { space(); count += 1 }
        
        if !visualWord.contains("_") {
            space()
            print("YOU WIN!!")
            count = 0
            visualWord.removeAll()
            reStart()
            break
        } else if count == 6 {
            space()
            print("GAME OVER...")
            print("The word was \"\(word)\"")
            visualWord.removeAll()
            count = 0
            reStart()
            break
        }
        if userInput1 == "1" {
            continue
        }
        lettersLeft = lettersLeft.replacingOccurrences(of: String(userInput1), with: " ")
        hangmanImage()
        print("below will be the unused letter list")
        print(lettersLeft.uppercased())
    }
}

space()
print("Welcome to Eddie's Hangman Beta 0.1.1")
sleep(1)
print("The rule for this game is simple")
sleep(1)
print("You can see what will be the lenghs of the word so try to figure out based on that")
sleep(1)
print("YOU ARE ONLY ALLOWED TO TYPE IN \"ONE\" WORD AT A TIME")
sleep(1)
print("IF YOU TYPE IN MORE THEN 1 LETTER YOU'LL BE KICKED OUT")
sleep(1)
print("You will have 5 chance to make a mistake but if you miss on the 6th time")
sleep(1)
print("\"THE GAME IS OVER\"")
sleep(1)
print("type in \"START\" if you're ready")
sleep(1)
print("if you don't want to play, type any other thing")

let start = readLine()?.lowercased() ?? "-1"

if start == "start" {
    space()
    print("GOOD LUCK!!!!")
    sleep(2)
    space()
    hangman(randomWord())
}



