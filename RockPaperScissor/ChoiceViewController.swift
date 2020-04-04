//
//  ChoiceViewController.swift
//  RockPaperScissor
//
//  Created by LALIT JAGTAP on 4/3/20.
//  Copyright © 2020 LALIT JAGTAP. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playRock(_ sender: Any) {
        let resultsVC = self.storyboard?.instantiateViewController(identifier: "ResultsViewController") as! ResultsViewController
        
        resultsVC.userMove = getUserMove(sender as! UIButton)
        self.present(resultsVC, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(_ sender: Any) {
        self.performSegue(withIdentifier: "showResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let resultsVC = segue.destination as? ResultsViewController {
                resultsVC.userMove = getUserMove(sender as! UIButton)
            }
        }
    }
    
    private func getUserMove(_ sender: UIButton) -> GameMove {
        //let move = sender.restorationIdentifier!
        let move = sender.title(for: UIControl.State())!
        return GameMove(rawValue: move)!
    }

}

