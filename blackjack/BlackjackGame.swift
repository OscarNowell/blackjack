//
//  blackjackGame.swift
//  blackjack
//
//  Created by Oscar Nowell on 15/10/2025.
//

import Foundation

class BlackjackGame {
    var deckOfCards: Deck = Deck()
    var dealer: Player = Player(type: .computer)
    var player: Player = Player(type: .human)
    
    var dealersTurn: Bool = false
    var endOfGame: Bool = false
    
    func startNewGame() {
        for _ in 0...1 {
            player.hand.append(deckOfCards.deal())
            dealer.hand.append(deckOfCards.deal())
        }
    }
    
    func hit() {
        if dealersTurn {
            dealer.hand.append(deckOfCards.deal())
        } else {
            player.hand.append(deckOfCards.deal())
        }
    }
    
    func stand() {
        if !dealersTurn {
            dealersTurn = true
        } else {
            endOfGame = true
        }
    }
    
    func calculateHandValue(for hand: [Deck.Card]) -> Int {
        var value = 0
        
        for card in hand {
            value += card.values[0]
        }
        
        return value
    }
}

struct Player {
    
    let type: PlayerType
    var hand: [Deck.Card] = []
    
    enum PlayerType {
        case human
        case computer
    }
}

struct Deck {
    
    var cards: [Card]
    
    init() {
        cards = Deck.createFullDeck().shuffled()
    }
    
    mutating func deal() -> Card {
        return cards.popLast()!
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
    
    struct Card: Equatable {
        let suit: String
        let name: String
        let values: [Int]
    }
}
