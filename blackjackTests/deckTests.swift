//
//  deckTests.swift
//  blackjackTests
//
//  Created by Oscar Nowell on 15/10/2025.
//

import XCTest
@testable import blackjack

@MainActor
final class deckTests: XCTestCase {
    
    var deck: Deck!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        deck = Deck()
    }

    func test_deck_hasCards() throws {
        XCTAssertNotNil(deck.cards)
    }
    
    func test_deck_onInit_has52Cards() throws {
        XCTAssertTrue(deck.cards.count == 52)
    }
    
    func test_deck_kingCardType_hasCorrectValue() throws {
        let king = deck.cards.first(where: { $0.name == "king" })
        
        XCTAssertEqual(king?.values[0], 10)
    }
    
    func test_deck_twoCardType_hasCorrectValue() throws {
        let two = deck.cards.first(where: { $0.name == "two" })
        
        XCTAssertEqual(two?.values[0], 2)
    }
    
    func test_deck_aceCardType_hasCorrectValues() throws {
        let ace = deck.cards.first(where: { $0.name == "ace" })
        
        XCTAssertEqual(ace?.values[0], 1)
        XCTAssertEqual(ace?.values[1], 11)
    }
    
    func test_deck_deal_correctlyDealsCard() throws {
        let firstCard = deck.cards[deck.cards.count-1]
        let secondCard = deck.cards[deck.cards.count-2]
        
        let firstDealtCard = deck.deal()
        let secondDealtCard = deck.deal()
        
        XCTAssertEqual(firstCard, firstDealtCard)
        XCTAssertEqual(secondCard, secondDealtCard)
    }
    
    func test_deck_deal_deal7TimesRemoves7Cards() throws {
        for _ in 1...7 {
            deck.deal()
        }
        
        XCTAssertTrue(deck.cards.count == 45)
    }
}
