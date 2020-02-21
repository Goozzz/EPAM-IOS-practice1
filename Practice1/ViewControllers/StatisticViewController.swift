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
    
    var stepCount = ""
    var gameCount = ""
    
    @IBOutlet weak var gameCountLabel: UILabel!
    @IBOutlet weak var stepCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameCountLabel.text = gameCount
        stepCountLabel.text = stepCount
    }
    
    @IBAction func pressButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
