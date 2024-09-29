//
//  ContentView.swift
//  yahtzee
//
//  Created by Armando Meza on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var attempts: Int = 0
    @State var score: Int = 0
    @State var diceList: [Dice] = [
        Dice(value: 1, isSelected: false, id: "1"),
        Dice(value: 1, isSelected: false, id: "2"),
        Dice(value: 1, isSelected: false, id: "3"),
        Dice(value: 1, isSelected: false, id: "4"),
        Dice(value: 1, isSelected: false, id: "5"),
    ]
    
    func someAction (dice: Dice) {
        dice.isSelected.toggle()
    }
    
    func onCategorySelect () {
        self.attempts = 0
    }
    
    func otherRollDice () {
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
                    CategoryButton(categoryName: "One")
                    CategoryButton(categoryName: "Three of a kind")
                }
                HStack {
                    CategoryButton(categoryName: "Two")
                    CategoryButton(categoryName: "Four of a kind")
                }
                HStack {
                    CategoryButton(categoryName: "Three")
                    CategoryButton(categoryName: "Full House")
                }
                HStack {
                    CategoryButton(categoryName: "Four")
                    CategoryButton(categoryName: "Small Straight")
                }
                HStack {
                    CategoryButton(categoryName: "Five")
                    CategoryButton(categoryName: "Large Straight")
                }
                HStack {
                    CategoryButton(categoryName: "Six")
                    CategoryButton(categoryName: "Yahtzee")
                }
                HStack {
                    CategoryButton(categoryName: "Chance")
                }
            }.frame(width: UIScreen.main.bounds.width).padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            VStack {
                Button(action: otherRollDice) {
                    let buttonText = attempts < 3 ? "Roll Dice" : "Select Category"
                    Text(buttonText).font(.title)
                }
                Text("Rolls Remaining: \(3 - attempts)")
            }
            HStack {
                ForEach(self.diceList) { dice in
                    Button(action: {someAction(dice: dice)}){
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
