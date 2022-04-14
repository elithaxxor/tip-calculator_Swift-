//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by a-robot on 4/14/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
   // var resultsObj = CalculateViewController()

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var results = "0.0"
    var split = 1.00
    var tip =  0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = results
        settingsLabel.text = "Split between \(split) persons, with a \(tip)% tip."
        
    }
    
    @IBAction func recalcAction(_ sender: UIButton) {
        print(results)
        print(split)
        print(tip)
        self.dismiss(animated: true, completion: nil)
    }
    


}
