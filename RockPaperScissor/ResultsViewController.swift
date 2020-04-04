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
        
        var showImageName: String
        var showText: String
        let gameMove = "\(userMove.rawValue) vs \(opponentMove.rawValue)"
        
        switch (userMove!, opponentMove) {
        case let (user, opponent) where (user == opponent):
            showText = "\(gameMove): Its a tie!"
            showImageName = "tie"
            
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            showText = "You win with \(gameMove)"
            showImageName = "\(userMove.rawValue)-\(opponentMove.rawValue)"

        default:
            showText = "You lose with \(gameMove)"
            showImageName = "\(opponentMove.rawValue)-\(userMove.rawValue)"
        }
        showImageName = showImageName.lowercased()
        resultImageView.image = UIImage(named: showImageName)
        resultLabel.text = showText
    }
    
    @IBAction func playItAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
