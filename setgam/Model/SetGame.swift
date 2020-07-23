//
//  SetGame.swift
//  setgam
//
//  Created by Zhe Liu on 7/21/20.
//  Copyright © 2020 Zhe Liu. All rights reserved.
//

import Foundation

enum ShapeCount: Int, CaseIterable {
    case single = 1
    case double = 2
    case triple = 3
}

enum ShapeType: CaseIterable {
    case diamond
    case rectangle
    case oval
}

enum ShapeShading: CaseIterable {
    case solid
    case semiSolid
    case transparent
}

enum ShapeColor: CaseIterable {
    case red
    case green
    case purple
}

struct SetGame {
    
    private(set) var cardDeck: [SetCard]
    private(set) var currentCards: [SetCard]
    
    var hasMoreCards: Bool {
        get {
            return cardDeck.count > 0
        }
    }
    
    private let initialDealtCardsCount:Int = 12
    private let normalDealCardsCount:Int = 3
    
    private static func initializeAllSetCards() -> [SetCard] {
        var cards = Array<SetCard>()
        var index = 0
        for shapeCount in ShapeCount.allCases {
            for shapeType in ShapeType.allCases {
                for shapeShading in ShapeShading.allCases {
                    for shapeColor in ShapeColor.allCases {
                        cards.append(SetCard(cardContent: CardContent(shapeCount: shapeCount, shapeType: shapeType, shapeShading: shapeShading, shapeColor: shapeColor), id: index))
                        index += 1
                    }
                }
            }
        }
        return cards
    }
    
    private mutating func dealMoreCards() {
        currentCards.append(contentsOf: cardDeck.removeAndReturnWithItemCount(itemCount: normalDealCardsCount))
    }
    
    mutating func chooseCard(card: SetCard) {
        
    }

    init() {
        var shuffledCards = SetGame.initializeAllSetCards().shuffled()
        currentCards = shuffledCards.removeAndReturnWithItemCount(itemCount: initialDealtCardsCount)
        cardDeck = shuffledCards
    }
    
    struct SetCard: Identifiable {
        var cardContent: CardContent
        
        //card attributes
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
        
    }
    
    struct CardContent {
        var shapeCount: ShapeCount
        var shapeType: ShapeType
        var shapeShading: ShapeShading
        var shapeColor: ShapeColor
    }
}
