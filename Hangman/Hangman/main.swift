//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let hangmanWords = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua", "Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands","Yemen","Zambia","Zimbabwe"]

print("Welcome to the game of hangman (countries edition). This game will test the knowledge you have for the countries around the world 🌍.")
print()
sleep(2)
print("You will have a total of 6 chances to guess the word that was randomly selected inorder to beat the game. Once you have used your 6th chance the game is end. So guess your words wisely.")
print()
sleep(2)
print("""

888               888                   888888b.                     🌍🌍
888               888                   888  "88b                    🌍🌍
888               888                   888  .88P
888       .d88b.  888888 .d8888b        8888888K.   .d88b.   .d88b.  888 88888b.
888      d8P🌍Y8b 888    88K            888  "Y88b d8P🌍Y8b d88P"88b 888 888 "88b
888      88888888 888    "Y8888b.       888    888 88888888 888🌍888 888 888  888
888      Y8b.     Y88b.       X88       888   d88P Y8b.     Y88b 888 888 888  888
88888888  "Y8888   "Y888  88888P'       8888888P"   "Y8888   "Y88888 888 888  888
                                                                 888
                                                            Y8b d88P
                                                             "Y88P"
""")
print()
sleep(1)
print("If you are ready to take on the challenge type \"ready\" to begin the game.")
sleep(1)

let startGame = "ready"
var userStart = readLine()?.lowercased().trimmingCharacters(in: .whitespaces)

repeat {
    if userStart == startGame {
        print()
        print("Welcome to the game, glhf(good luck have fun)")
    }
    else {
        print()
        print("Please play the game. Its kinda fun")
        userStart = readLine()
    }
} while userStart != startGame

print()
sleep(1)
print("Thank you for starting the game.")








