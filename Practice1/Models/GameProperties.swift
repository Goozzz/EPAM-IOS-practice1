//
//  GameProperty.swift
//  Practice1
//
//  Created by Евгений Гусев on 20.02.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import Foundation

struct GameProperties {
    var minNumber: Int
    var maxNumber: Int
    var bestSteps: Int
    var games: Int
    var guessedNumber: Int
    
    init(min: Int, max: Int) {
        minNumber = min
        maxNumber = max
        games = 0
        bestSteps = 9999
        guessedNumber = Int.random(in: minNumber...maxNumber)
    }
    
}
