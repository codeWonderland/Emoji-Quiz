//
//  QuestionViewController.swift
//  EmojiQuiz
//
//  Created by Blanchard, Cai on 2/5/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    
    @IBOutlet weak var emojis: UILabel!
    @IBOutlet weak var phrase: UILabel!
    @IBOutlet weak var guessedLetters: UILabel!
    
    
    
    // these are just placeholders for now
    let topicOneEmojis: [[String]] = [["👹🚪🏢", "monsters inc"], ["🏎️🚜", "cars"], ["🎈🏠🎈", "up"], ["🕷🧑", "spiderman"], ["👸🏿🐸", "princess and the frog"], ["🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶", "a hundred and one dalmations"], ["⬆️🏫🎶", "high school musical"], ["🌲🌳📖", "jungle book"], ["👩🐻🌹", "beauty and the beast"], ["🦊🏹", "robin hood"]]
    let topicTwoEmojis: [[String]] = [["👹✍️👩", "frankenstein"], ["📖 😩🧒", "diary of a wimpy kid"], ["🤴👸💀🎭", "romeo and juliet"], ["🧙‍♂🙆‍♂️🎩", "harry potter"], ["🐦💀", "to kill a mockingbird"], ["🖥️🎭", "macbeth"], ["🐖🎭", "hamlet"], ["🔥", "fire"], ["🌪", "tornado"], ["💨", "wind"]]
    var theseEmojis: [[String]] = []
    var guessedLetterArray: [String] = []
    var correctLettersArray: [String] = []
    var numQuestions = 0
    var thisPrompt: String = "noodle"
    var numWrong = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set current emoji quizzes
        let topic = UserDefaults.standard.string(forKey: "topic")
        numQuestions = UserDefaults.standard.integer(forKey: "numQuestions")
        if topic == "Disney" {
            theseEmojis = topicOneEmojis
        } else {
            theseEmojis = topicTwoEmojis
        }
        theseEmojis.shuffle()
        
        newPrompt()
    }
    
    @IBAction func guessLetter(_ sender: UIButton) {
        /*
         - on key check to see if in guessedLetter array
         - if in array: ignore
         - if not in array: check to see if in answer string
         - if in answer string: update guesedLetters
         - if not RELEASE THE BEES
        */
        
        let character = sender.title(for: .normal)!
        
        if !(guessedLetterArray.contains(character)) {
            guessedLetterArray.append(character)
            
            if thisPrompt.contains(character) {
                let currentChar = character[character.startIndex]
                
                for i in 0..<thisPrompt.count {
                    let promptChar = thisPrompt[thisPrompt.index(
                        thisPrompt.startIndex,
                        offsetBy: i)]
                    
                    // check each char in string to match
                    if promptChar == currentChar {
                        
                        // update the correct letter array
                        correctLettersArray[i] = String(currentChar)
                        
                        if correctLettersArray.contains("_") == false {
                            // word is guessed!
                            endPrompt()
                        }
                        
                        phrase.text = correctLettersArray.joined(separator: String(" "))
                    }
                }
                
                updatePhrase()
            } else {
                // failure
                // play a funny sound
                numWrong = numWrong + 1
                
                if numWrong >= 3 {
                    // you out fam
                }
            }
            
            sender.isEnabled = false
        }
    }
    
    func updatePhrase() {
        
    }
    
    func endPrompt() {
        
        numQuestions -= 1
        if numQuestions < 0 {
            // game over! you won!
            
        } else {
            newPrompt()
        }
        
    }
    
    func newPrompt() {
        
        // set the phrase as a prompt of underscores ___ for each letter
        thisPrompt = theseEmojis[numQuestions][1]
        correctLettersArray = Array(repeating: "_", count: thisPrompt.count)
        
        for i in 0..<thisPrompt.count {
            let promptChar = thisPrompt[thisPrompt.index(
                thisPrompt.startIndex,
                offsetBy: i)]
            
            // check each char in string to match
            if promptChar == " " {
                
                // update the correct letter array
                correctLettersArray[i] = " "
            }
        }
        
        phrase.text = correctLettersArray.joined(separator: String(" "))
        emojis.text = theseEmojis[numQuestions][0]
        
        // numQuestions should be incremented when a prompt is completed.
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    

}
