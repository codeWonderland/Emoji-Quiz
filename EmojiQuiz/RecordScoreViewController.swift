//
//  RecordScoreViewController.swift
//  EmojiQuiz
//
//  Created by Blanchard, Cai on 2/14/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import UIKit

class RecordScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let score = UserDefaults.standard.integer(forKey: "score")
        
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
