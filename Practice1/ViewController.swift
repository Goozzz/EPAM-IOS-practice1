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
    
    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var inputNumberButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var dialogLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startNewGame() {
        resetButton.isHidden = true
        inputNumberButton.isHidden = false
        userGuessTextField.text = ""
        gameNumber = Int.random(in: minNumber...maxNumber)
        dialogLabel.text = "Guess the number!"
    }
    
    func finishGame() {
        inputNumberButton.isHidden = true
        resetButton.isHidden = false
        dialogLabel.text = "Congratulations!"
    }
    
    func checkGuess(guessNumber: Int) {
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
        if let guessString = userGuessTextField.text, let guessNumber = Int(guessString) {
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
}


