//
//  Dice.swift
//  yahtzee
//
//  Created by Armando Meza on 11/7/22.
//

import Foundation

class Dice: Identifiable, ObservableObject {
    @Published var value: Int
    var isSelected: Bool
    var id: String
    
    init(value: Int, isSelected: Bool, id: String) {
        self.value = value
        self.isSelected = isSelected
        self.id = id
    }
    
    func setValue (newValue: Int) {
        self.value = newValue
    }
}
