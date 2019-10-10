
import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against"]

var decision: Character = "."
var usedWords: Set<Character> = ["."]
var letterInWord = false
var counter = 0
var winCounter = 0
var yourWord = allTheWords.randomElement()
var wordArray = [Character](yourWord ?? "Error")
var blankArray = [Character]("")
for _ in 1...wordArray.count {
    blankArray.append("_")
}
func winCycle () {
    print(blankArray)
    print("You win!")
}
func hangman() {
print(blankArray)
decision = Character(readLine() ?? "Error")
for index in 0...wordArray.count - 1 {
    if usedWords.contains(decision)    {
        break
    } else if wordArray[index] == decision {
        blankArray[index] = decision
        winCounter += 1
        letterInWord = true
        }
    }
    if letterInWord == false {
        print("Miss!")
        counter += 1
    }
    if letterInWord == true {
        usedWords.insert(decision)
    }
    if winCounter == wordArray.count {
        winCycle()
    } else {
    letterInWord = false
    print(counter)
    hangman()
    }
}
hangman()
    

 
