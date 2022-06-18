//
//  Game.swift
//  DirectHit
//
//  Created by Jiaming Guo on 2022-06-12.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        var result = 100 - difference
        // If the slider value is right equal to the target there's a bonus of 100 points
        if difference == 0 {
            result += 100
        // If the slider value is less than 2 off the target there's a bonus of 50 points
        } else if difference <= 2 {
            result += 50
        }
        return result
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func startNewGame() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}
