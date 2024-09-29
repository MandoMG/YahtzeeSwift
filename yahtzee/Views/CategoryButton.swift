//
//  CategoryButton.swift
//  yahtzee
//
//  Created by Armando Meza on 9/26/24.
//

import SwiftUI

struct CategoryButton: View {
    @State var categoryType: GameCategories
    @Binding var score: Int
    @Binding var diceList: [Dice]
    var onCategorySelect: () -> Void
    
    @State private var categoryScore = 0
    @State private var hasBeenPressed = false

    func getValueFromNumberCategory() -> Int {
        if(categoryType.rawValue <= 6) {
            return diceList.filter { $0.value == categoryType.rawValue }.reduce(0, { x, y in
                x + y.value
            })
        }
        
        return 0;
    }
    
    func calculateCategoryScore() {
        switch categoryType {
        case .One, .Two, .Three, .Four, .Five, .Six:
            self.categoryScore = getValueFromNumberCategory()
        case .ThreeOfAKind:
            self.categoryScore = score
        case .FourOfAKind:
            self.categoryScore = score
        case .FullHouse:
            self.categoryScore = 25
        case .SmallStraight:
            self.categoryScore = 30
        case .LargeStraight:
            self.categoryScore = 40
        case .Yahtzee:
            self.categoryScore = 50
        case .Chance:
            self.categoryScore = diceList.reduce(0, { x, y in
                x + y.value
            })
        }
    }

    func categorySelection() {
        if(!self.hasBeenPressed) {
            calculateCategoryScore()
            score += self.categoryScore
            self.hasBeenPressed.toggle()
            onCategorySelect()
        }
    }
    
    func getCategoryName() -> String {
        switch categoryType {
        case GameCategories.One:
            return "One"
        case GameCategories.ThreeOfAKind:
            return "Three of a Kind"
        case GameCategories.Yahtzee:
            return "Yahtzee"
        case .Two:
            return "Two"
        case .Three:
            return "Three"
        case .Four:
            return "Four"
        case .Five:
            return "Five"
        case .Six:
            return "Six"
        case .FourOfAKind:
            return "Four of a Kind"
        case .FullHouse:
            return "Full House"
        case .SmallStraight:
            return "Small Straight"
        case .LargeStraight:
            return "Large Straight"
        case .Chance:
            return "Chance"

        }
    }
    
    var body: some View {
        HStack {
            Button(action: self.categorySelection) {
                Text(getCategoryName()).font(.title2).frame(width: 100, alignment: .leading)
            }
            
            Text("\(self.categoryScore)").font(.title).padding(Edge.Set.horizontal, 10)
        }.frame(alignment: .leading).padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}

struct CategoryButton_Previews: PreviewProvider {
    @State static var score = 0
    @State static var diceList: [Dice] = [
        Dice(value: 1, isSelected: false, id: "1"),
        Dice(value: 1, isSelected: false, id: "2"),
        Dice(value: 1, isSelected: false, id: "3"),
        Dice(value: 1, isSelected: false, id: "4"),
        Dice(value: 1, isSelected: false, id: "5"),
    ]

    static func onCategorySelect () {
        // do nothing
    }

    static var previews: some View {
        VStack{
            CategoryButton(categoryType: GameCategories.One, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
            CategoryButton(categoryType: GameCategories.ThreeOfAKind, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
            CategoryButton(categoryType: GameCategories.Yahtzee, score: $score, diceList: $diceList, onCategorySelect: onCategorySelect)
        }
    }
}
