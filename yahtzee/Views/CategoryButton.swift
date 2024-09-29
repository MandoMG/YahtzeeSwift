//
//  CategoryButton.swift
//  yahtzee
//
//  Created by Armando Meza on 9/26/24.
//

import SwiftUI

struct CategoryButton: View {
    @State var categoryName: String
    
    func categorySelection() {
        
    }

    var body: some View {
        HStack {
            Button(action: categorySelection) {
                Text(categoryName).font(.title2).frame(width: 100, alignment: .leading)
            }
            
            Text("0").font(.title).padding(Edge.Set.horizontal, 10)
        }.frame(alignment: .leading).padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CategoryButton(categoryName: "One")
            CategoryButton(categoryName: "Three of a Kind")
            CategoryButton(categoryName: "Yahtzee")
        }
    }
}
