//
//  GameManager.swift
//  Practice1
//
//  Created by Евгений Гусев on 20.02.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import Foundation

enum numberComparison {
    case more
    case less
    case match
}

protocol GameManagerProtocol: class {
    func configForNewGame()
    func setRange(min: Int, max: Int)
    func checkMatch(playerNumber: Int) -> numberComparison
}

class GameManager: GameManagerProtocol {
    private let DEFAULT_MIN_NUMBER = 0
    private let DEFAULT_MAX_NUMBER = 100
    
    private var gameProperties: GameProperties
    
    init () {
        self.gameProperties = GameProperties(min: self.DEFAULT_MIN_NUMBER,
                                         max: self.DEFAULT_MAX_NUMBER)
    }
    
    func configForNewGame() {
        self.gameProperties.guessedNumber = getRandomNumber()
    }
    
    func setRange(min: Int, max: Int) {
        if(max < min) {
            return
        }
        
        self.gameProperties.minNumber = min
        self.gameProperties.maxNumber = max
        self.gameProperties.guessedNumber = getRandomNumber()
    }
    
    func checkMatch(playerNumber: Int) -> numberComparison {
        if playerNumber > self.gameProperties.guessedNumber {
            return .more
        } else if playerNumber < self.gameProperties.guessedNumber{
            return .less
        } else {
            return .match
        }
    }
    
    private func getRandomNumber() -> Int{
        return Int.random(in: self.gameProperties.minNumber...self.gameProperties.maxNumber)
    }
}
