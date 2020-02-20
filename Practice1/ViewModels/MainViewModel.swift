//
//  MainViewModelController.swift
//  Practice1
//
//  Created by Евгений Гусев on 20.02.2020.
//  Copyright © 2020 Евгений Гусев. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol: class {
    func starNewGame()
    func checkMatch(playerNumber: String?)
}

protocol UpdataRangeDelegate: class {
        func updateRange(min: Int, max: Int)
}

class MainViewModel: MainViewModelProtocol, UpdataRangeDelegate {
    private let gameManager = GameManager()
    private let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func checkMatch(playerNumber: String?) {
        self.gameManager.checkMatch(playerNumber: 0)
    }
    
    func starNewGame() {
        self.gameManager.configForNewGame()
    }
    
    func updateRange(min: Int, max: Int) {
        self.gameManager.setRange(min: min, max: max)
    }
}
