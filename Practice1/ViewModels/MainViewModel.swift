//
//  MainViewModelController.swift
//  Practice1
//
//  Created by Евгений Гусев on 20.02.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import Foundation

protocol UpdataRangeDelegate: class {
    func updateRange(userMin: String?, userMax: String?)
}

class GameViewModel: UpdataRangeDelegate {
    private let gameManager = GameManager()
    
    func checkMatch(playerText: String?) -> numberComparison {
        guard let text = playerText, let number = Int(text) else {
            return .undefiend
        }
        
        return gameManager.checkMatch(playerNumber: number)
    }
    
    func starNewGame() {
        gameManager.configForNewGame()
    }
    
    func updateRange(userMin: String?, userMax: String?) {
        guard let minText = userMin,
            let min = Int(minText),
            let maxText = userMax,
            let max = Int(maxText) else {
            return
        }
        
        gameManager.setRange(min: min, max: max)
    }
    
    func getSteps() -> String {
        return String(gameManager.getSteps())
    }
    func getRange() -> (String, String) {
        let (min, max) = gameManager.getRange()
        return (String(min), String(max))
    }
    
    func getStatistic() -> (String, String){
        let (games, steps) = gameManager.getStatistic()
        return (String(games), String(steps))
    }
}
