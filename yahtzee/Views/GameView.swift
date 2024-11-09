//
//  GameView.swift
//  yahtzee
//
//  Created by Armando Meza on 10/2/24.
//

import SwiftUI

struct GameView: View {
    // Controls the back navigation
    @Environment(\.presentationMode) var presentationMode
    @State private var shouldShowAlert = false
    
    @State var attempts: Int = 0
    @State private var score: Int = 0
    @State private var diceList: [Dice] = [
        Dice(value: 1, isSelected: false, id: "1"),
        Dice(value: 1, isSelected: false, id: "2"),
        Dice(value: 1, isSelected: false, id: "3"),
        Dice(value: 1, isSelected: false, id: "4"),
        Dice(value: 1, isSelected: false, id: "5"),
    ]
    
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
        NavigationView {
            VStack {
                Text("Yahtzee!").font(.largeTitle)
                Text("Total Score: \(score)")
                HStack {
                    VStack {
                        CategoryButton(categoryType: GameCategories.One, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Two, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Three, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Four, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Five, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Six, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Chance, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    }
                    VStack {
                        CategoryButton(categoryType: GameCategories.ThreeOfAKind, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.FourOfAKind, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.FullHouse, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.SmallStraight, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.LargeStraight, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                        CategoryButton(categoryType: GameCategories.Yahtzee, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
                    }
                }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                    .disabled(attempts == 0)
                VStack {
                    Button(action: onDiceRoll) {
                        let buttonText = attempts < 3 ? "Roll Dice" : "Select Category"
                        Text(buttonText).font(.title)
                    }
                    .disabled(attempts == 3)
                    Text("Rolls Remaining: \(3 - attempts)")
                }
                HStack {
                    ForEach(self.diceList) { dice in
                        DiceView(dice: dice, attempts: $attempts)
                    }
                }.padding(20)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            if (self.score > 0) {
                self.shouldShowAlert = true
            } else {
                resetDice()
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Image(systemName: "chevron.left")
            Text("End Game")
        })
        .alert(isPresented: $shouldShowAlert) {
            Alert(
                title: Text("Confirm"),
                message: Text("Are you sure you want to go back? Current game score will be lost."),
                primaryButton: .default(Text("Yes")) {
                    // Dismiss the view when user taps "Yes"
                    resetDice()
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel(Text("No"))  // Close alert if "No" is tapped
                )
            
        }
    }
}

#Preview {
    GameView()
}
