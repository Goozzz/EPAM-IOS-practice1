//
//  SettingsViewController.swift
//  Practice1
//
//  Created by Евгений Гусев on 29.01.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var minNumber = 1
    var maxNumber = 100
    
    @IBOutlet weak var minNumberTextField: UITextField!
    @IBOutlet weak var maxNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func saveNumberChange(_ sender: Any) {
        print("okay")
        if let userMinText = minNumberTextField.text, let userMinNumber = Int(userMinText) {
            if let userMaxText = maxNumberTextField.text, let userMaxNumber = Int(userMaxText) {
                if userMinNumber < userMaxNumber {
                    minNumber = userMinNumber
                    maxNumber = userMaxNumber
                    minNumberTextField.text = ""
                    maxNumberTextField.text = ""
                }
            } else {
                if userMinNumber < maxNumber {
                    minNumber = userMinNumber
                    minNumberTextField.text = ""
                }
            }
        } else {
            if let userMaxText = maxNumberTextField.text, let userMaxNumber = Int(userMaxText) {
                if userMaxNumber > minNumber {
                    maxNumber = userMaxNumber
                    maxNumberTextField.text = ""
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameSegue" {
            if let controller = segue.destination as? ViewController{
                controller.minNumber = minNumber
                controller.maxNumber = maxNumber
            }
        }
    }
    
    
    
}
