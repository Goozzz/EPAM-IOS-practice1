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
    var guessedNumber: Int
    
    init(min: Int, max: Int) {
        self.minNumber = min
        self.maxNumber = max
        guessedNumber = Int.random(in: self.minNumber...self.maxNumber)
    }
    
}
