//
//  ContentView.swift
//  yahtzee
//
//  Created by Armando Meza on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Yahtzee!").font(.largeTitle)
            NavigationLink(destination: GameView()) {
                Text("New Game").font(.title).padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
