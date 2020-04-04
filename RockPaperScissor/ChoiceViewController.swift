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
        // present resuluts view controller
        // setup the property
        
        let resultsVC = self.storyboard?.instantiateViewController(identifier: "ResultsViewController") as! ResultsViewController
        
        let senderButton = sender as! UIButton

        print(senderButton.restorationIdentifier!)
        print(senderButton.tag)
        
        resultsVC.result = senderButton.restorationIdentifier ?? ""
        self.present(resultsVC, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(_ sender: Any) {
        self.performSegue(withIdentifier: "showResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderButton = sender as? UIButton {
            if let resultsVC = segue.destination as? ResultsViewController {
                resultsVC.result = senderButton.restorationIdentifier ?? ""
            }
        }
    }

}

