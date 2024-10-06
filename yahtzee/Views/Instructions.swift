//
//  Instructions.swift
//  yahtzee
//
//  Created by Armando Meza on 10/5/24.


import SwiftUI

struct Instructions: View {
    let categoriesDescription: [CategoryDescription] = [
        CategoryDescription(name: "Ones - Sixes", description: "Total of all dice matching the value of the category"),
        CategoryDescription(name: "Three of a Kind", description: "At least three dice showing the same number. Score: Total of all five dice."),
        CategoryDescription(name: "Four of a Kind", description: "At least four dice showing the same number. Score: Total of all five dice."),
        CategoryDescription(name: "Full House", description: "Three of one number and two of another. Score: 25 points."),
        CategoryDescription(name: "Small Straight", description: "Four consecutive numbers (e.g., 1-2-3-4). Score: 30 points."),
        CategoryDescription(name: "Large Straight", description: "Five consecutive numbers (e.g., 1-2-3-4-5). Score: 40 points."),
        CategoryDescription(name: "Yahtzee", description: "All five dice showing the same number. Score: 50 points."),
        CategoryDescription(name: "Chance", description: "Any combination of dice. Score: Total of all five dice."),
        CategoryDescription(name: "Yahtzee Bonus", description: "If you roll more than one Yahtzee in the game, you score an additional 100 points for each extra Yahtzee."),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Gameplay").font(.largeTitle).padding(.top, 10)
                    Text("The game uses five dice. You get three rolls per turn.")
                    
                    Text("Rolling the dice").font(.title).padding(.top, 10)
                    Text("Roll all five dice. After the first roll, you may select which ones to keep. You may reroll all the unselected dice up to two more times (for a total of three rolls per turn). The goal is to score as many points as possible by rolling specific combinations.")
                    
                    Text("Scoring").font(.title).padding(.top, 10)
                    Text("After the third roll (or sooner if you choose) you must place the score in one of the boxes in the scorecard. Once a box is filled, it cannot be used again for the remainder of the game.")
                    
                    Text("Categories").font(.title).padding(.top, 10)
                    ForEach(self.categoriesDescription) { category in
                        VStack {
                            HStack {
                                Text(category.name).frame(width: 100).font(.headline)
                                Text(category.description)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                        }
                    }
                }.padding(EdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 16))
            }
        }
        .navigationTitle("Game Rules")
        .onAppear {
            // Set the background color for the navigation bar
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemBackground // Set your desired color
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    Instructions()
}
