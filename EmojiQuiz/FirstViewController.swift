//
//  FirstViewController.swift
//  EmojiQuiz
//
//  Created by Blanchard, Cai on 2/5/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var questionStepper: UIStepper!
    @IBOutlet weak var topicButtonOne: UIButton!
    @IBOutlet weak var topicButtonTwo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionStepper.maximumValue = 10.0
        questionStepper.minimumValue = 1.0
    }

    @IBAction func setNumQuestions(_ sender: UIStepper) {
        let numQuestions = Int(questionStepper.value)
        
        questionCount.text = "\(numQuestions)"
        
        UserDefaults.standard.set(numQuestions, forKey: "numQuestions")
    }
    
    @IBAction func clickTopic(_ sender: UIButton) {
        UserDefaults.standard.set(sender.title(for: .normal)!, forKey: "topic")
        
        print("Topic: \(sender.title(for: .normal)!)")
    }
    
    
}

