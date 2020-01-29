//
//  ViewController.swift
//  Practice1
//
//  Created by Евгений Гусев on 23.01.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameNumber = 0
    var minNumber = 1
    var maxNumber = 100
    var userSteps = 0
    
    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var inputNumberButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var dialogLabel: UILabel!
    @IBOutlet weak var userStepsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startNewGame() {
        resetButton.isHidden = true
        inputNumberButton.isHidden = false
        userGuessTextField.text = ""
        userSteps = 0
        gameNumber = Int.random(in: minNumber...maxNumber)
        dialogLabel.text = "Guess \(minNumber).. \(maxNumber)!"
    }
    
    func finishGame() {
        inputNumberButton.isHidden = true
        resetButton.isHidden = false
        dialogLabel.text = "Congratulations!"
    }
    
    func checkGuess(guessNumber: Int) {
        userSteps += 1
        userStepsLabel.text = String(userSteps)
        
        if(guessNumber < minNumber || guessNumber > maxNumber) {
            dialogLabel.text = "out of range"
            return
        }
        
        if guessNumber == gameNumber {
            finishGame()
        } else if guessNumber >  gameNumber {
            dialogLabel.text = "Number is less"
        } else {
            dialogLabel.text = "Number is greater"
        }
    }

    @IBAction func enterGuess(_ sender: Any) {
        if let userText = userGuessTextField.text, let guessNumber = Int(userText) {
            userGuessTextField.text = ""
            checkGuess(guessNumber: guessNumber)
        } else {
            userGuessTextField.text = ""
            return
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        startNewGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSettingsSegue" {
            if let controller = segue.destination as? SettingsViewController{
                controller.minNumber = minNumber
                controller.maxNumber = maxNumber
            }
        }
    }
    
}


