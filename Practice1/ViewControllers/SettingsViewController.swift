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
    
    weak var delegate: UpdataRangeDelegate?
    
    @IBOutlet weak var minNumberTextField: UITextField!
    @IBOutlet weak var maxNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveNumberChange(_ sender: Any) {
        delegate?.updateRange(userMin: minNumberTextField.text,
                              userMax: maxNumberTextField.text)
        
        minNumberTextField.text = ""
        maxNumberTextField.text = ""
    }
    
    @IBAction func dismissView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


