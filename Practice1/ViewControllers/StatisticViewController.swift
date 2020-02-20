//
//  StatisticViewController.swift
//  Practice1
//
//  Created by Евгений Гусев on 30.01.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import Foundation
import UIKit

class StatisticViewController: UIViewController {
    
    var stepCount = 0
    var gameCount = 0
    
    @IBOutlet weak var gameCountLabel: UILabel!
    @IBOutlet weak var stepCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameCountLabel.text = String(gameCount)
        stepCountLabel.text = String(stepCount)
    }
    
    @IBAction func pressButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
