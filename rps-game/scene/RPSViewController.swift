//
//  RPSViewController.swift
//  rps-game
//
//  Created by Simone on 17/09/2020.
//  Copyright © 2020 Simone Massaro. All rights reserved.
//

import UIKit

enum Choice {
    case Rock
    case Paper
    case Scissors
}

class RPSViewController: UIViewController {
    @IBOutlet weak var opponentChoiceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    @IBAction func clickPaper(_ sender: Any) {
        myChoiceLabel.text = "🖐️"
    }
    @IBAction func clickScissors(_ sender: Any) {
        myChoiceLabel.text = "✌️"
    }
    @IBAction func clickRock(_ sender: Any) {
        myChoiceLabel.text = "✊"
    }

    var textColorNormal = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textColorNormal = resultLabel.tintColor
        let randomInt = Int.random(in: 0..<3)
        
        switch randomInt {
        case 0:
            opponentChoiceLabel.text = "🧟"
        case 1:
            opponentChoiceLabel.text = "👨"
        case 2:
            opponentChoiceLabel.text = "👩‍🦰"
        default:
            opponentChoiceLabel.text = ""
        }
    }
}
