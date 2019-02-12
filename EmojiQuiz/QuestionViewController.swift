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
    
    // these are just placeholders for now
    let topicOneEmojis: [String] = ["🤩", "😍", "🤨", "🤯", "😱", "🤓", "🤬", "🤒", "😴", "😤"]
    let topicTwoEmojis: [String] = ["⚡️", "🌟", "🌈", "🌦", "❄️", "☂️", "☀️", "🔥", "🌪", "💨"]
    var theseEmojis: [String] = []
    var numQuestions = 0
    
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
    }
    
    
    func newPrompt() {
        
        // set the phrase as a prompt of underscores ___ for each letter
        let thisPrompt = theseEmojis[numQuestions]
        
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
