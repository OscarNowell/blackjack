//
//  blackjackTests.swift
//  blackjackTests
//
//  Created by Oscar Nowell on 15/10/2025.
//

import XCTest
@testable import blackjack

final class blackjackTests: XCTestCase {
    
    var blackjackGame: BlackjackGame!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        blackjackGame = BlackjackGame()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_blackjackGame_hasDeckOfCards() throws {
        // tests that the blackjackGame has a deck of cards
        XCTAssertNotNil(blackjackGame.deckOfCards)
    }
}
