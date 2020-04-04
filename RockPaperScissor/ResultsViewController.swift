//
//  ResultsViewController.swift
//  RockPaperScissor
//
//  Created by LALIT JAGTAP on 4/3/20.
//  Copyright © 2020 LALIT JAGTAP. All rights reserved.
//

import UIKit

enum GameMove: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func drawRandomMove() -> GameMove {
        let moves = ["Rock", "Paper", "Scissors"]
        let random = Int(arc4random_uniform(3))
        return GameMove(rawValue: moves[random])!
    }
}


class ResultsViewController: UIViewController {

    var result: String?
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var userMove: GameMove!
    private var opponentMove: GameMove = GameMove.drawRandomMove()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showResults()
    }
    
    // MARK: Update UI
    
    // This method compares users move with opponent (randomly genenrated) move. Based on the result it updates the image and label.
    private func showResults() {
        
        // Do any additional setup after loading the view.
        if let result = result {
            print("display the \(result) result")
        }
        
        switch result {
        case "rock":
            print("display RockCrushesScissors")
            resultImageView.image = UIImage(named: "RockCrushesScissors")
            resultLabel.text = "Rock crushes scissors. You win!"
            
        case "paper":
            print("display PaperCoversRock")
            resultImageView.image = UIImage(named: "PaperCoversRock")
            resultLabel.text = "Paper covers rock. You loose!"

        case "scissors":
            print("display ScissorsCutPaper")
            resultImageView.image = UIImage(named: "ScissorsCutPaper")
            resultLabel.text = "Scissors cut paper. You loose!"

        default:
            resultImageView.image = nil
            resultLabel.text = "Its a tie!"

            print("its a tie")
        }
    }
    
    @IBAction func playItAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
