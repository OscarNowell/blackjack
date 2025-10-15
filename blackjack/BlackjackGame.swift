//
//  blackjackGame.swift
//  blackjack
//
//  Created by Oscar Nowell on 15/10/2025.
//

import Foundation

class BlackjackGame {
    var deckOfCards: [Deck] = []
}

struct Deck {
    let cards: [Card]
    
    init() {
        cards = []
    }
    
    struct Card {
        let suit: String
        let name: String
        let values: [Int]
    }
}
