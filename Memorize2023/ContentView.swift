//
//  ContentView.swift
//  Memorize2023
//
//  Created by Mateusz on 05/07/2026.
//

import SwiftUI

struct ContentView: View { // behaves like a...


    var body: some View { //is of type..
        
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
         }
      
        .foregroundStyle(.orange)
        .padding(15)
        
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var message: String = "👻"
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text(message).font(.largeTitle.bold())
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}

