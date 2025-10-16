//
//  blackjackTests.swift
//  blackjackTests
//
//  Created by Oscar Nowell on 15/10/2025.
//

import XCTest
@testable import blackjack

@MainActor
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
    
    func test_blackjackGame_hasDealer() throws {
        // tests that the blackjackGame starts with a dealer
        XCTAssertNotNil(blackjackGame.dealer)
    }
    
    func test_blackjackGame_hasPlayer() throws {
        // tests that the blackjackGame starts with a player
        XCTAssertNotNil(blackjackGame.player)
    }
    
    func test_blackjackGame_dealerIsPlayerTypeComputer() throws {
        // tests that the initial dealer is of PlayerType.dealer
        XCTAssertEqual(blackjackGame.dealer.type, Player.PlayerType.computer)
    }
    
    func test_blackjackGame_playerIsPlayerTypeHuman() throws {
        // tests that the initial player is of PlayerType.human
        XCTAssertEqual(blackjackGame.player.type, Player.PlayerType.human)
    }
    
    func test_blackjackGame_dealerHasHandOfCards() throws {
        // tests that the dealer starts with a hand of cards
        XCTAssertNotNil(blackjackGame.dealer.hand)
    }
    
    func test_blackjackGame_playerHasHandOfCards() throws {
        // tests that the player starts with a hand of cards
        XCTAssertNotNil(blackjackGame.player.hand)
    }
    
    func test_blackjackGame_startNewGameDealsTwoCardsToEachPlayer() throws {
        blackjackGame.startNewGame()
        
        XCTAssertTrue(blackjackGame.dealer.hand.count == 2)
        XCTAssertTrue(blackjackGame.player.hand.count == 2)
    }
    
    func test_blackjackGame_hit_correctlyDealsOneCardToPlayerWhenNotDealersTurn() throws {
        blackjackGame.startNewGame()
        blackjackGame.hit()
        
        XCTAssertTrue(blackjackGame.player.hand.count == 3)
    }
    
    func test_blackjackGame_hit_correctlyDealsOneCardsToDealerWhenDealersTurn() throws {
        blackjackGame.dealersTurn = true
        blackjackGame.startNewGame()
        blackjackGame.hit()
        
        XCTAssertTrue(blackjackGame.dealer.hand.count == 3)
    }
    
    func test_blackjackGame_stand_changesToDealersTurnIfCalledByPlayer() throws {
        blackjackGame.stand()
        
        XCTAssertTrue(blackjackGame.dealersTurn)
    }
    
    func test_blackjackGame_stand_endsGameIfCalledByDealer() throws {
        blackjackGame.dealersTurn = true
        blackjackGame.stand()
        
        XCTAssertTrue(blackjackGame.endOfGame)
    }
    
    func test_blackjackGame_calculateHandValue_returnsCorrectValue() throws {
        blackjackGame.player.hand.append(Deck.Card(suit: "spades", name: "two", values: [2]))
        blackjackGame.player.hand.append(Deck.Card(suit: "hearts", name: "jack", values: [10]))
        
        let expectedValue: Int = 12
        
        let returnedValue = blackjackGame.calculateHandValue(for: blackjackGame.player.hand)
        
        XCTAssertEqual(expectedValue, returnedValue)
    }
    
    func test_blackjackGame_calculateHandValue_returnsCorrectValueWhenHandHasAce() throws {
        blackjackGame.player.hand.append(Deck.Card(suit: "spades", name: "two", values: [2]))
        blackjackGame.player.hand.append(Deck.Card(suit: "hearts", name: "ace", values: [1, 11]))
        
        let expectedValue: Int = 13

        let returnedValue = blackjackGame.calculateHandValue(for: blackjackGame.player.hand)
        
        XCTAssertEqual(expectedValue, returnedValue)
    }
    
    func test_blackjackGame_calculateHandValue_returnsCorrectValueWhenHandHasAceAndOver21() throws {
        blackjackGame.player.hand.append(Deck.Card(suit: "spades", name: "nine", values: [9]))
        blackjackGame.player.hand.append(Deck.Card(suit: "hearts", name: "ace", values: [1, 11]))
        blackjackGame.player.hand.append(Deck.Card(suit: "clubs", name: "king", values: [10]))
        
        let expectedValue: Int = 20

        let returnedValue = blackjackGame.calculateHandValue(for: blackjackGame.player.hand)
        
        XCTAssertEqual(expectedValue, returnedValue)
    }
    
    func test_blackjackGame_calculateHandValue_returnsCorrectValueWhenHandHasTwoAcesAndOver21() throws {
        blackjackGame.player.hand.append(Deck.Card(suit: "spades", name: "ace", values: [1, 11]))
        blackjackGame.player.hand.append(Deck.Card(suit: "hearts", name: "ace", values: [1, 11]))
        blackjackGame.player.hand.append(Deck.Card(suit: "clubs", name: "nine", values: [9]))
        
        let expectedValue: Int = 21

        let returnedValue = blackjackGame.calculateHandValue(for: blackjackGame.player.hand)
        
        XCTAssertEqual(expectedValue, returnedValue)
    }
    
    func test_blackjackGame_calculateHandValue_returnsCorrectValueWhenHandHasTwoAcesAndOver21BustAmount() throws {
        blackjackGame.player.hand.append(Deck.Card(suit: "spades", name: "ace", values: [1, 11]))
        blackjackGame.player.hand.append(Deck.Card(suit: "hearts", name: "ace", values: [1, 11]))
        blackjackGame.player.hand.append(Deck.Card(suit: "clubs", name: "10", values: [10]))
        blackjackGame.player.hand.append(Deck.Card(suit: "hearts", name: "king", values: [10]))
        
        let expectedValue: Int = 22

        let returnedValue = blackjackGame.calculateHandValue(for: blackjackGame.player.hand)
        
        XCTAssertEqual(expectedValue, returnedValue)
    }
    
    
}
