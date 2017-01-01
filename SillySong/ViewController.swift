//
//  ViewController.swift
//  SillySong
//
//  Created by knax on 12/30/16.
//  Copyright © 2016 StepwiseDesigns. All rights reserved.
//

import UIKit

func stripLocalChars(_ convertString :String)->String {
    /*code tip from Udacity forum
     https://discussions.udacity.com/t/silly-song-application-how-do-we-deal-with-special-symbols-like-o-while-writing-the-function-to-short-the-name/202143/3 */
     return convertString.folding(options: .diacriticInsensitive, locale: .current)
}


func shortNameFromName(name:String) -> String {
    
    let vowels:[Character] =  ["a","e","i","o","u","y"]
    let makeLowercase = name.lowercased()
    
    //pratice encapsulation with helper function
    var shortName = stripLocalChars(makeLowercase)
    
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

//Udacity delegate extension
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {
    //MARK: - UITextFieldDelegate

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
}
