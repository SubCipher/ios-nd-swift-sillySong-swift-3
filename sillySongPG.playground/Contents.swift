//: Playground - noun: a place where people can play

import UIKit



let vowels:[Character] =  ["a","e","i","o","u","y"]

func shortNameFromName(name:String) -> String {
  
   
    let fullName = name
    let makeLocal = fullName.lowercased()
    
    /*code tip from Udacity forum
    https://discussions.udacity.com/t/silly-song-application-how-do-we-deal-with-special-symbols-like-o-while-writing-the-function-to-short-the-name/202143/3 */
    
    var shortName = makeLocal.folding(options: .diacriticInsensitive, locale: .current)

    for letter in shortName.characters {
        if vowels.contains(letter) {
            return shortName
        }
        else {
           shortName.characters.removeFirst()
        }
    }
    return shortName
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    var modLyrics = lyricsTemplate
    
  
    modLyrics = modLyrics.replacingOccurrences(of: "<FULL_NAME>,", with: fullName + ",")
    modLyrics = modLyrics.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    modLyrics = modLyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    modLyrics = modLyrics.replacingOccurrences(of: "<SHORT_NAME>,", with: shortName + ",")
        
    return modLyrics
    
}
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate"))


 let word1 = "love"
let word2 = "löve"













