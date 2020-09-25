//
//  ViewController.swift
//  Practice1
//
//  Created by Евгений Гусев on 23.01.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum labelsText {
        static let congratulationText = NSLocalizedString("Congratulations!", comment: "")
        static let startGameText = NSLocalizedString("Guess the number!", comment: "")
        static let numberGreaterText = NSLocalizedString("Number is greater", comment: "")
        static let numberLessText = NSLocalizedString("Number is less", comment: "")
    }
    
    private let gameViewModel = GameViewModel()

    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var inputNumberButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var dialogLabel: UILabel!
    @IBOutlet weak var userStepsLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startNewGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueIdentifier = segue.identifier
        switch segueIdentifier {
        case "showSettingsSegue":
            if let destinationController = segue.destination as? SettingsViewController {
                destinationController.delegate = gameViewModel.self
            }
        case "showStatisticSegue":
            if let destinationController = segue.destination as? StatisticViewController {
                let (gameCount, bestStepCount) = gameViewModel.getStatistic()
                destinationController.gameCount = gameCount
                destinationController.stepCount = bestStepCount
            }
        default:
            return
        }
    }
    
    @IBAction func enterGuess(_ sender: Any) {
        let checked = gameViewModel.checkMatch(playerText: userGuessTextField.text)
        
        switch checked {
        case .less:
            dialogLabel.text = labelsText.numberLessText
        case .more:
            dialogLabel.text = labelsText.numberGreaterText
        case .match:
            finishGame()
        case .undefiend:
            userGuessTextField.text = ""
        }
        
        userGuessTextField.text = ""
        userStepsLabel.text = gameViewModel.getSteps()
    }
    
    @IBAction func reset(_ sender: Any) {
        startNewGame()
    }
    
    func startNewGame() {
        resetButton.isHidden = true
        inputNumberButton.isHidden = false
        userGuessTextField.text = ""
        dialogLabel.text = labelsText.startGameText
        let (minNumber, maxNumber) = gameViewModel.getRange()
        rangeLabel.text = "\(minNumber)..\(maxNumber)"
        gameViewModel.starNewGame()
    }
    
    func finishGame() {
        inputNumberButton.isHidden = true
        resetButton.isHidden = false
        dialogLabel.text = labelsText.congratulationText
    }
}


