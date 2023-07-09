//
//  ViewController.swift
//  RockPaperScissorsApp
//
//  Created by Ecem Akçay on 8.07.2023.
//

import UIKit

class ViewController: UIViewController {

    var yourScore = 0
    var pcScore = 0
    
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var pcScoreLabel: UILabel!
    
    
    @IBOutlet weak var rockBtnImage: UIButton!
    
    @IBOutlet weak var paperBtnImage: UIButton!
    
    @IBOutlet weak var scissorsBtnImage: UIButton!
    
    @IBOutlet weak var infoLayer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Rock Paper Scissors 🎮"
        
        rockBtnImage.layer.cornerRadius = 30
        paperBtnImage.layer.cornerRadius = 30
        scissorsBtnImage.layer.cornerRadius = 30
        infoLayer.layer.cornerRadius = 30
        
        yourScoreLabel.text = "Your score: \(yourScore)"
        pcScoreLabel.text = "PC score: \(pcScore)"
    }

    func game(choice: Choices) {
        let rd = Choices.randomset()

        if rd == choice {
            // It's a tie
        
        } else if rd == .rock && choice == .scissors || rd == .paper && choice == .rock || rd == .scissors && choice == .paper {
            // PC wins
            pcScore += 1
          
        } else if rd == .rock && choice == .paper || rd == .paper && choice == .scissors || rd == .scissors && choice == .rock {
            // You win
            yourScore += 1
          
        }
        
        updateScores()
        performSegue(withIdentifier: "1to2", sender: (choice, rd))
    }
    
    func updateScores() {
        yourScoreLabel.text = "Your score: \(yourScore)"
        pcScoreLabel.text = "PC score: \(pcScore)"
    }
    
    @IBAction func rockBtn(_ sender: Any) {
        game(choice: .rock)
    }

    @IBAction func paperBtn(_ sender: Any) {
        game(choice: .paper)
    }
    
    @IBAction func scissorsBtn(_ sender: Any) {
        game(choice: .scissors)
    }
    
    @IBAction func resetBtn(_ sender: Any) {
         yourScore = 0
         pcScore = 0
         updateScores()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "1to2" {
            if let secondVC = segue.destination as? SecondVC {
                secondVC.userSelection = getImageForChoice((sender as? (Choices, Choices))?.0)
                secondVC.pcSelection = getImageForChoice((sender as? (Choices, Choices))?.1)
                secondVC.result = getResultString((sender as? (Choices, Choices))?.0, (sender as? (Choices, Choices))?.1)
            }
        }
    }

    func getImageForChoice(_ choice: Choices?) -> UIImage? {
        guard let choice = choice else { return nil }
        
        switch choice {
        case .rock:
            return UIImage(named: "rock")
        case .paper:
            return UIImage(named: "paper")
        case .scissors:
            return UIImage(named: "scissors")
        }
    }
    
    func getResultString(_ userChoice: Choices?, _ pcChoice: Choices?) -> String {
        guard let userChoice = userChoice, let pcChoice = pcChoice else { return "" }
        
        if userChoice == pcChoice {
            return "Scoreless 😐"
        } else if (userChoice == .rock && pcChoice == .scissors) || (userChoice == .paper && pcChoice == .rock) || (userChoice == .scissors && pcChoice == .paper) {
            return "Congratsssss 🥳"
        } else {
            return "Try again 😵"
        }
    }
}

enum Choices: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
    
    static func randomset() -> Choices {
        let choices: [Choices] = [.scissors, .paper, .rock]
        let randomIndex = Int.random(in: 0..<choices.count)
        return choices[randomIndex]
    }
}
