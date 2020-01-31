//
//  ViewController.swift
//  Practice1
//
//  Created by Евгений Гусев on 23.01.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func update(minNumber: Int, maxNumber: Int)
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    let congratulationText = NSLocalizedString("Congratulations!", comment: "")
    let startGameText = NSLocalizedString("Guess the number!", comment: "")
    let numberGreaterText = NSLocalizedString("Number is greater", comment: "")
    let numberLessText = NSLocalizedString("Number is less", comment: "")

    var gameNumber = 0
    var gameCount = 0
    var stepCount = 0
    var bestStepCount = 9999
    var minNumber = UserDefaults.standard.integer(forKey: "Min")
    var maxNumber = UserDefaults.standard.integer(forKey: "Max")

    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var inputNumberButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var dialogLabel: UILabel!
    @IBOutlet weak var userStepsLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startNewGame()
    }
    
    func update(minNumber: Int, maxNumber: Int) {
        self.minNumber = minNumber
        self.maxNumber = maxNumber
        print(self)
    }
    
    func startNewGame() {
        resetButton.isHidden = true
        inputNumberButton.isHidden = false
        userGuessTextField.text = ""
        stepCount = 0
        gameNumber = Int.random(in: minNumber...maxNumber)
        dialogLabel.text = startGameText
        rangeLabel.text = "\(minNumber)..\(maxNumber)"
    }
    
    func finishGame() {
        if stepCount < bestStepCount {
            bestStepCount = stepCount
        }
        gameCount += 1
        inputNumberButton.isHidden = true
        resetButton.isHidden = false
        dialogLabel.text = congratulationText
    }
    
    func checkGuess(guessNumber: Int) {
        stepCount += 1
        userStepsLabel.text = String(stepCount)
        
        if(guessNumber < minNumber || guessNumber > maxNumber) {
            dialogLabel.text = "out of range"
            return
        }
        
        if guessNumber == gameNumber {
            finishGame()
        } else if guessNumber >  gameNumber {
            dialogLabel.text = numberLessText
        } else {
            dialogLabel.text = numberGreaterText
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
            if let destinationController = segue.destination as? SettingsViewController {
                destinationController.minNumber = minNumber
                destinationController.maxNumber = maxNumber
                destinationController.delegate = self
            }
        }
        
        if segue.identifier == "showStatisticSegue" {
            if let destinationController = segue.destination as? StatisticViewController {
                destinationController.gameCount = gameCount
                destinationController.stepCount = bestStepCount
                print(self)
            }
        }
    }
}


