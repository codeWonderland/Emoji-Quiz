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
    @IBOutlet weak var lives: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var iButton: UIButton!
    @IBOutlet weak var jButton: UIButton!
    @IBOutlet weak var kButton: UIButton!
    @IBOutlet weak var lButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var nButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var pButton: UIButton!
    @IBOutlet weak var qButton: UIButton!
    @IBOutlet weak var rButton: UIButton!
    @IBOutlet weak var sButton: UIButton!
    @IBOutlet weak var tButton: UIButton!
    @IBOutlet weak var uButton: UIButton!
    @IBOutlet weak var vButton: UIButton!
    @IBOutlet weak var wButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var zButton: UIButton!

    var keyboard: [UIButton] = []

    // these are just placeholders for now
    var topicOneEmojis: [[String]] = []
    var topicTwoEmojis: [[String]] = []
    var theseEmojis: [[String]] = []
    var guessedLetterArray: [String] = []
    var correctLettersArray: [String] = []
    var numQuestions = 0
    var thisPrompt: String = "noodle"
    var numLives = 3 // counts down
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data_path = Bundle.main.path(forResource: "quiz_data", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: data_path)
        
        topicOneEmojis = dict!.object(forKey: "movies") as! [[String]]
        topicTwoEmojis = dict!.object(forKey: "books") as! [[String]]

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
        
        // set keyboard
        keyboard = [self.aButton, self.bButton, self.cButton, self.dButton, self.eButton, self.fButton, self.gButton, self.hButton, self.iButton, self.jButton, self.kButton, self.lButton, self.mButton, self.nButton, self.oButton, self.pButton, self.qButton, self.rButton, self.sButton, self.tButton, self.uButton, self.vButton, self.wButton, self.xButton, self.yButton, self.zButton]
        
        print("here!")
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
        var word_guessed = false
        
        if !(guessedLetterArray.contains(character)) {
            guessedLetterArray.append(character)
            
            if thisPrompt.contains(character) {
                let currentChar = character[character.startIndex]
                
                for i in 0..<thisPrompt.count {
                    let promptChar = thisPrompt[thisPrompt.index(
                        thisPrompt.startIndex,
                        offsetBy: i)]
                    
                    // check each char in string to see if guess is correct
                    if promptChar == currentChar {
                        
                        // update the correct letter array
                        correctLettersArray[i] = String(currentChar)
                        
                        // check if entire word is guessed
                        word_guessed = correctLettersArray.contains("_") == false
                        
                        if word_guessed  {
                            // word is guessed!
                            print("you got it!")
                            endPrompt()
                            break;
                        } else {
                            phrase.text = correctLettersArray.joined(separator: String(" "))
                            
                        }
                        
                    }
                }
                
                updatePhrase()
            } else {
                // failure
                // play a funny sound
                numLives = numLives - 1
                lives.text = String(repeating: "❤️", count: numLives)
                
                if numLives <= 0 {
                    // you out fam :/
                    UserDefaults.standard.set(score, forKey: "score")
                }
            }
            
            if !word_guessed {
                sender.isEnabled = false
            }
        }
    }
    
    func updatePhrase() {
        
    }
    
    func endPrompt() {
        
        phrase.text = correctLettersArray.joined(separator: String(" "))
        score = score + 1
        
        // numQuestions should be decremented when a prompt is completed.
        numQuestions -= 1
        if numQuestions <= 0 {
            // game over! you won!
            
        } else {
            newPrompt()
        }
        
    }
    
    func newPrompt() {
        
        // set the phrase as a prompt of underscores ___ for each letter
        thisPrompt = theseEmojis[numQuestions - 1][1]
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
        emojis.text = theseEmojis[numQuestions - 1][0]
        
        for i in 0..<keyboard.count {
            keyboard[i].isEnabled = true
        }
        
        // clear out guessedLetterArray
        guessedLetterArray = []
        
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
