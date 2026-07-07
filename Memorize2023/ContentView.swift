//
//  ContentView.swift
//  Memorize2023
//
//  Created by Mateusz on 05/07/2026.
//

import SwiftUI

struct ContentView: View { // behaves like a...
    
    let emojis: Array<String> = ["👻", "🕷️", "🎃", "😈", "🧛","💀", "👹", "🦇", "🕸️", "⚰️", "🧙", "🍬"]
    @State var cardCount: Int = 4

    var body: some View { //is of type..
        VStack {
            ScrollView(.vertical) {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(),GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in
                // index in is arg. for a trailing closure
                CardView(isFaceUp: false, content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
        .padding(10)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            Group {
                cardRemover
                Spacer()
                cardAdder
            }
            .padding(.horizontal, 30)
            .imageScale(.large)
            .font(.largeTitle)
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
            Button() {
                cardCount += offset
            } label: {
                Image(systemName: symbol)
            }
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }

}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle.bold())
            }
            base.fill().opacity(isFaceUp ? 0 : 1)
            
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

