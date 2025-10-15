//
//  deckTests.swift
//  blackjackTests
//
//  Created by Oscar Nowell on 15/10/2025.
//

import XCTest
@testable import blackjack

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
}
