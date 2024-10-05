//
//  Dice.swift
//  yahtzee
//
//  Created by Armando Meza on 11/7/22.
//

import Foundation

// A class that conforms to ObservableObject
// lets SwiftUI views that @Published variables
// should notify the view of changes so that the
// view is rendered

class Dice: Identifiable, ObservableObject {
    @Published var value: Int
    @Published var isSelected: Bool
    var id: String
    
    init(value: Int, isSelected: Bool, id: String) {
        self.value = value
        self.isSelected = isSelected
        self.id = id
    }
    
    func setValue (newValue: Int) {
        self.value = newValue
    }
    
    func toggleSelection() {
        self.isSelected.toggle()
    }
}
