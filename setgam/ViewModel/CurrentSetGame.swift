//
//  CurrentSetGame.swift
//  setgam
//
//  Created by Zhe Liu on 7/21/20.
//  Copyright © 2020 Zhe Liu. All rights reserved.
//

import Foundation

class CurrentSetGame: ObservableObject {
    
    @Published private var game: SetGame
    
    init() {
        game = SetGame()
    }
    
    // MARK: - Access To The Model
    
    var currentGameCards: Array<SetGame.SetCard> {
        return game.currentCards
    }
    
    // MARK: - Intents
    
    func choose(card: SetGame.SetCard) {
        game.chooseCard(card: card)
    }
    
}
