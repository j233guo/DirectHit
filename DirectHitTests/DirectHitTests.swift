//
//  DirectHitTests.swift
//  DirectHitTests
//
//  Created by Jiaming Guo on 2022-06-12.
//

import XCTest
@testable import DirectHit

class DirectHitTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let difference = Int.random(in: 1...100)
        let correctScore = 100 - difference
        let guess = game.target + difference
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, correctScore)
    }
    
    func testScoreNegative() {
        let difference = Int.random(in: 1...100)
        let correctScore = 100 - difference
        let guess = game.target - difference
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, correctScore)
    }
}
