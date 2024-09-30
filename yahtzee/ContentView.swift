//
//  ContentView.swift
//  yahtzee
//
//  Created by Armando Meza on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var attempts: Int = 0
    @State private var score: Int = 0
    @State var diceList: [Dice] = [
        Dice(value: 1, isSelected: false, id: "1"),
        Dice(value: 1, isSelected: false, id: "2"),
        Dice(value: 1, isSelected: false, id: "3"),
        Dice(value: 1, isSelected: false, id: "4"),
        Dice(value: 1, isSelected: false, id: "5"),
    ]
    
    func selectDice (dice: Dice) {
        if (attempts != 0) {
            dice.isSelected.toggle()
        }
    }
    
    func onCategorySelect () {
        self.attempts = 0
        resetDice()
    }
    
    func resetDice () {
        self.diceList = diceList.map { dice in {
            dice.setValue(newValue: 1)
            dice.isSelected = false
            return dice
        }()
        }
    }
    
    func onDiceRoll () {
        if (attempts < 3) {
            self.diceList = diceList.map { dice in {
                if !dice.isSelected {
                    let diceRoll = Int.random(in: 1...6)
                    dice.setValue(newValue: diceRoll)
                }
                
                return dice
            }()
            }
            self.attempts += 1
        }
    }
    
    var body: some View {
        VStack {
            Text("Yahtzee!").font(.largeTitle)
            Text("Total Score: \(score)")
            VStack {
                HStack {
                    CategoryButton(categoryType: GameCategories.One, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    CategoryButton(categoryType: GameCategories.ThreeOfAKind, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
                HStack {
                    CategoryButton(categoryType: GameCategories.Two, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    CategoryButton(categoryType: GameCategories.FourOfAKind, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
                HStack {
                    CategoryButton(categoryType: GameCategories.Three, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    CategoryButton(categoryType: GameCategories.FullHouse, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
                HStack {
                    CategoryButton(categoryType: GameCategories.Four, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    CategoryButton(categoryType: GameCategories.SmallStraight, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
                HStack {
                    CategoryButton(categoryType: GameCategories.Five, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    CategoryButton(categoryType: GameCategories.LargeStraight, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
                HStack {
                    CategoryButton(categoryType: GameCategories.Six, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    CategoryButton(categoryType: GameCategories.Yahtzee, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
                HStack {
                    CategoryButton(categoryType: GameCategories.Chance, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                }
            }.frame(width: UIScreen.main.bounds.width).padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            VStack {
                Button(action: onDiceRoll) {
                    let buttonText = attempts < 3 ? "Roll Dice" : "Select Category"
                    Text(buttonText).font(.title)
                }
                Text("Rolls Remaining: \(3 - attempts)")
            }
            HStack {
                ForEach(self.diceList) { dice in
                    Button(action: {selectDice(dice: dice)}){
                        Text("\(dice.value)").font(.title).padding(20).underline(dice.isSelected)
                    }
                }
            }.padding(20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
