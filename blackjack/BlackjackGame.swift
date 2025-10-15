//
//  blackjackGame.swift
//  blackjack
//
//  Created by Oscar Nowell on 15/10/2025.
//

import Foundation

class BlackjackGame {
    var deckOfCards: Deck = Deck()
    var dealer: String = "dealer"
    var player: String = "player"
}

struct Deck {
    let cards: [Card]
    
    init() {
        cards = Deck.createFullDeck().shuffled()
    }
    
    private static func createFullDeck() -> [Card] {
        
        var newDeck: [Card] = []
        let suits: [String] = ["hearts", "diamonds", "clubs", "spades"]
        let names: [String] = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]
        
        for suit in suits {
            for i in 1...13 {
                if i == 1 {
                    newDeck.append(Card(suit: suit, name: names[i-1], values: [i, 11]))
                } else if (11...13).contains(i) {
                    newDeck.append(Card(suit: suit, name: names[i-1], values: [10]))
                } else {
                    newDeck.append(Card(suit: suit, name: names[i-1], values: [i]))
                }
            }
        }
        
        return newDeck
    }
    
    struct Card {
        let suit: String
        let name: String
        let values: [Int]
    }
}
