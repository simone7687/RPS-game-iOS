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
        Play(myChoice: Choice.Paper)
    }
    @IBAction func clickScissors(_ sender: Any) {
        myChoiceLabel.text = "✌️"
        Play(myChoice: Choice.Scissors)
    }
    @IBAction func clickRock(_ sender: Any) {
        myChoiceLabel.text = "✊"
        Play(myChoice: Choice.Rock)
    }

    var textColorNormal = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textColorNormal = resultLabel.textColor
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

    func randomChoice() -> Choice {
        let randomInt = Int.random(in: 0..<3)
        switch randomInt {
        case 0:
            opponentChoiceLabel.text = "🖐️"
            return Choice.Paper
        case 1:
            opponentChoiceLabel.text = "✌️"
            return Choice.Scissors
        case 2:
            opponentChoiceLabel.text = "✊"
            return Choice.Rock
        default:
            return Choice.Paper
        }
    }

    func Play(myChoice : Choice)
    {
        let rivalChoice = randomChoice()
        var win = false

        if (rivalChoice == myChoice) {
            resultLabel.text = "Equal."
            resultLabel.textColor = textColorNormal
            return
        }
        else if (myChoice == Choice.Rock && rivalChoice == Choice.Scissors) {
            win = true
        }
        else if (myChoice == Choice.Rock && rivalChoice == Choice.Paper) {
            win = false
        }
        else if (myChoice == Choice.Scissors && rivalChoice == Choice.Paper) {
            win = true
        }
        else if (myChoice == Choice.Scissors && rivalChoice == Choice.Rock) {
            win = false
        }
        else if (myChoice == Choice.Paper && rivalChoice == Choice.Rock) {
            win = true
        }
        else if (myChoice == Choice.Paper && rivalChoice == Choice.Scissors) {
            win = false
        }

        if (win) {
            resultLabel.text = "Good, you won."
            resultLabel.textColor = UIColor.green
        }
        else {
            resultLabel.text = "Sorry, you lost."
            resultLabel.textColor = UIColor.red
        }
    }
}
