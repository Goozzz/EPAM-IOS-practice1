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
    case undefiend
}

protocol GameManagerProtocol: class {
    func configForNewGame()
    func setRange(min: Int, max: Int)
    func getSteps() -> Int
    func getRange() -> (min: Int, max: Int)
    func getStatistic() -> (games: Int, steps: Int)
    func checkMatch(playerNumber: Int) -> numberComparison
}

class GameManager: GameManagerProtocol {
    private var gameProperties: GameProperties
    private var steps = 0
    
    init () {
        let min = UserDefaults.standard.integer(forKey: "Min")
        let max = UserDefaults.standard.integer(forKey: "Max")
        gameProperties = GameProperties(min: min, max: max)
    }
    
    func configForNewGame() {
        steps = 0
        gameProperties.guessedNumber = getRandomNumber()
    }
    
    func setRange(min: Int, max: Int) {
        if(max < min) {
            return
        }
        
        UserDefaults.standard.set(min, forKey: "Min")
        UserDefaults.standard.set(max, forKey: "Max")
        
        gameProperties.minNumber = min
        gameProperties.maxNumber = max
        gameProperties.guessedNumber = getRandomNumber()
    }
    
    func checkMatch(playerNumber: Int) -> numberComparison {
        steps += 1
        
        if playerNumber > gameProperties.guessedNumber {
            return .less
        } else if playerNumber < gameProperties.guessedNumber{
            return .more
        } else {
            if steps < gameProperties.bestSteps {
                gameProperties.bestSteps = steps
            }
            gameProperties.games += 1
            
            return .match
        }
    }
    
    func getSteps() -> Int {
        return steps
    }
    
    func getRange() -> (min: Int, max: Int) {
        return (gameProperties.minNumber, gameProperties.maxNumber)
    }
    
    func getStatistic() -> (games: Int, steps: Int) {
        return (gameProperties.games, gameProperties.bestSteps)
    }
    
    private func getRandomNumber() -> Int{
        return Int.random(in: gameProperties.minNumber...gameProperties.maxNumber)
    }
}
