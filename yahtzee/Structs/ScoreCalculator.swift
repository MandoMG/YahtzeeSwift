//
//  ScoreCalculator.swift
//  yahtzee
//
//  Created by Armando Meza on 9/30/24.
//

import Foundation

struct ScoreCalculator {
    func getValueFromNumberCategory(categoryType: GameCategories, diceList: [Dice]) -> Int {
        if(categoryType.rawValue <= 6) {
            return diceList.filter { $0.value == categoryType.rawValue }.reduce(0, { x, y in
                x + y.value
            })
        }
        
        return 0;
    }
}
