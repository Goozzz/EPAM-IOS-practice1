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
    
    weak var delegate: ViewControllerDelegate?
    
    @IBOutlet weak var minNumberTextField: UITextField!
    @IBOutlet weak var maxNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func saveNumberChange(_ sender: Any) {
        if let userMinText = minNumberTextField.text, let userMinNumber = Int(userMinText) {
            if let userMaxText = maxNumberTextField.text, let userMaxNumber = Int(userMaxText) {
                if userMinNumber < userMaxNumber {
                    minNumber = userMinNumber
                    maxNumber = userMaxNumber
                    UserDefaults.standard.set(minNumber, forKey: "Min")
                    UserDefaults.standard.set(maxNumber, forKey: "Max")
                }
            } else {
                if userMinNumber < maxNumber {
                    minNumber = userMinNumber
                    UserDefaults.standard.set(minNumber, forKey: "Min")
                }
            }
        } else {
            if let userMaxText = maxNumberTextField.text, let userMaxNumber = Int(userMaxText) {
                if userMaxNumber > minNumber {
                    maxNumber = userMaxNumber
                    UserDefaults.standard.set(maxNumber, forKey: "Max")
                }
            }
        }
        
        delegate?.update(minNumber: minNumber, maxNumber: maxNumber)
        
        minNumberTextField.text = ""
        maxNumberTextField.text = ""
    }
}


