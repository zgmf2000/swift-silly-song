//
//  ViewController.swift
//  Silly Song
//
//  Created by Bintoro Adi Guna on 7/11/18.
//  Copyright © 2018 Vector Industries. All rights reserved.
//

import UIKit

let vowels: String = "aiueo";
let vowelCharacters = CharacterSet(charactersIn: vowels);
let emptyNameLyricsView = "Input your name to view your lyrics.";
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(name: String) -> String {
    var cleanedName = name.lowercased().folding(options: .diacriticInsensitive, locale: nil);
    var loopIndex: Int = 0;
    
    for character in cleanedName.unicodeScalars {
        if vowelCharacters.contains(character) {
            break;
        }
        loopIndex += 1;
    }
    
    if (loopIndex > 0) {
        let targetIndex = name.index(name.startIndex, offsetBy: loopIndex);
        cleanedName.remove(at: cleanedName.index(before: targetIndex));
    }
    
    return cleanedName;
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let fullNameWordToReplace = "<FULL_NAME>";
    let shortNameWordToReplace = "<SHORT_NAME>";
    let shortName = shortNameFromName(name: fullName);
    
    let fullLyrics = lyricsTemplate
        .replacingOccurrences(of: fullNameWordToReplace, with: fullName)
        .replacingOccurrences(of: shortNameWordToReplace, with: shortName);
    
    return fullLyrics;
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return false;
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = "";
        lyricsView.text = "";
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let template = bananaFanaTemplate;

        if let name = nameField.text {
            let finishedLyrics: String = lyricsForName(lyricsTemplate: template, fullName: name);
            lyricsView.text = finishedLyrics;
        } else {
            lyricsView.text = emptyNameLyricsView;
        }
    }
}

