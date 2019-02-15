//
//  SecondViewController.swift
//  EmojiQuiz
//
//  Created by Blanchard, Cai on 2/5/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
    @IBOutlet weak var scoreThree: UILabel!
    @IBOutlet weak var scoreFour: UILabel!
    @IBOutlet weak var scoreFive: UILabel!
    @IBOutlet weak var topicSelect: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setScores()
        
        topicSelect.addTarget(self, action: #selector(handleTopicSwap(_:)), for: .touchUpInside)
    }
    
    @IBAction func handleTopicSwap(_ sender: UIGestureRecognizer) {
        setScores()
    }

    func setScores() {
        let topic = topicSelect.titleForSegment(at: topicSelect.selectedSegmentIndex)!
        let scoreLabels: [UILabel] = [scoreOne, scoreTwo, scoreThree, scoreFour, scoreFive]
        var scores = [["Alice", 5], ["Alex", 4], ["Alex", 3], ["Alex", 2], ["Alex", 1]]
        
        if let user_scores = UserDefaults.standard.array(forKey: "\(topic)_scores") as! [String]? {
            scores = user_scores.map {
                return $0.split(separator: "-")
            }
        }
        
        for i in 0..<scoreLabels.count {
            scoreLabels[i].text = "\(scores[i][0]) - \(scores[i][1])"
        }
    }
}

