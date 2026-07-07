//
//  ContentView.swift
//  Memorize2023
//
//  Created by Mateusz on 05/07/2026.
//

import SwiftUI

struct ContentView: View { // behaves like a...
    
    let emojis: Array<String> = ["👻", "🕷️", "🎃", "😈"]

    var body: some View { //is of type..
        
        HStack {
            ForEach(emojis.indices, id: \.self) { index in //arg. for a trailing closure
                CardView(isFaceUp: false, content: emojis[index])
            }

         }
      
        .foregroundStyle(.orange)
        .padding(15)
        
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle.bold())
            } else {
                base.fill()
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

#Preview {
    ContentView()
}

