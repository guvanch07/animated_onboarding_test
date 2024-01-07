//
//  ContentView.swift
//  onboarding_test
//
//  Created by Guvanch Amanov on 2.01.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var cards: [Card] = [
        Card(cardColor: Color.green, actionText: "Pronto?", description: "Ordina domicilio senza limiti di distanza. Non e magia, e Moovenda!", asset: "images/image1"),
        Card(cardColor: Color.purple, actionText: "Promozioni", description: "Ogni tanto inviamo degli sconti esclusivi tramite notfiche push, ci stai?", asset: "images/image2"),
        Card(cardColor: Color.red, actionText: "Posizione", description: "Per sfruttare al massimo l'app, puoi condivideri la tua posizione?", asset: "images/image3")
    ]
    @State var topSpaceOfEach : CGFloat = 15
    @State var topCards : CGFloat = 2
    @State var removedCards: [Card] = []
    var body: some View {
        VStack{
            GeometryReader{ reader in
                let size = reader.size
                
                ZStack {
                    ForEach(cards) { card in
                        OnboardingStackedCard(cards: $cards,removedCards: $removedCards, card: card, topSpaceOfEach: topSpaceOfEach, topCards: topCards,removeFirst: removeFirst,returnFirst: returnFirst)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom,(topCards * topSpaceOfEach))
                .frame(height: size.height / 1.45)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
            BottomActionView(isFirst: removedCards.isEmpty,next: removeFirst,back: returnFirst)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    func removeFirst()  {
        withAnimation {
            if !cards.isEmpty{
                let removed  = cards.removeFirst()
                removedCards.append(removed)
            }
        }
    }
    func returnFirst()  {
        withAnimation {
            if !removedCards.isEmpty{
                cards.insert(removedCards.last!, at: 0)
                removedCards.removeLast()
            }
        }
    }
}

#Preview {
    ContentView()
}


