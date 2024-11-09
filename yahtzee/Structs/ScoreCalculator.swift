//
//  ScoreCalculator.swift
//  yahtzee
//
//  Created by Armando Meza on 9/30/24.
//

import Foundation

struct ScoreCalculator {
    static let shared = ScoreCalculator()
    
    func getValueFromNumberCategory(categoryType: GameCategories, diceList: [Dice]) -> Int {
        if(categoryType.rawValue <= 6) {
            return diceList.filter { $0.value == categoryType.rawValue }.reduce(0, { x, y in
                x + y.value
            })
        }
        
        return 0;
    }
    
    func calculateThreeOfAKind(diceList: [Dice]) -> Int {
        return calculateSomeOfAKind(diceList: diceList, howMany: 3)
    }
    
    func calculateFourOfAKind(diceList: [Dice]) -> Int {
        return calculateSomeOfAKind(diceList: diceList, howMany: 4)
    }
    
    func calculateFullHouse(diceList: [Dice]) -> Int {
        let counts = Dictionary(diceList.map { ($0.value, 1) }, uniquingKeysWith: +)
        
        if (counts.values.contains(3) && counts.values.contains(2)) {
            return 25
        }
        
        return 0
    }

    func calculateSmallStraight(diceList: [Dice]) -> Int {
        return hasStraight(diceList: diceList, isSmallStraight: true) ? 30 : 0
    }
    
    func calculateLargeStraight(diceList: [Dice]) -> Int {
        return hasStraight(diceList: diceList, isSmallStraight: true) ? 40 : 0
    }
    
    private func hasStraight(diceList: [Dice], isSmallStraight: Bool) -> Bool {
        var listHasStraight: Bool = false
        let limit = isSmallStraight ? 3 : 4 // how many other numbers to check for
        let sortedDice = Array(Set(diceList.map { $0.value })).sorted()
        
        if(sortedDice.count < limit) {
            return false;
        }
        
        for i in 0..<(sortedDice.count - limit) {
            let consecutiveSlice = sortedDice[i...i+limit]
            if consecutiveSlice.enumerated().allSatisfy({ $0.element == sortedDice[i] + $0.offset }) {
                listHasStraight = true
                break
            }
        }
        
        return listHasStraight;
    }
    
    func calculateYahtzee(diceList: [Dice], isFirstYahtzee: Bool) -> Int {
        let hasYahtzee = diceList.allSatisfy { $0.value == diceList.first?.value }
        
        if hasYahtzee {
            return isFirstYahtzee ? 50 : 100
        }
        
        return 0
    }

    func calculateChance(diceList: [Dice]) -> Int {
        return diceList.reduce(0, { x, y in
            x + y.value
        })
    }
    
    private func calculateSomeOfAKind(diceList: [Dice], howMany: Int) -> Int {
        let counts = Dictionary(diceList.map { ($0.value, 1) }, uniquingKeysWith: +)
        
        if counts.values.contains(howMany) {
            return diceList.reduce(0, { x, y in
                x + y.value
            })
        }
        
        return 0
    }

}
