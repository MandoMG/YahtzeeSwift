//
//  DiceView.swift
//  yahtzee
//
//  Created by Armando Meza on 10/2/24.
//

import SwiftUI

// Using this DiceView to explicitly tell ForEach loop
// that dice is an ObservedObject so that it updates
// state appropriately

struct DiceView: View {
    @ObservedObject var dice: Dice
    @Binding var attempts: Int
    
    var body: some View {
        Button(action: {
            if (attempts != 0) {
                dice.toggleSelection()
            }
        }){
            Text("\(dice.value)").font(.title).padding(20).underline(dice.isSelected)
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    @State static var attempts = 0
    @State static var dice = Dice(value: 1, isSelected: false, id: "1")
        
    static var previews: some View {
        DiceView(dice: dice, attempts: $attempts)
    }
}
