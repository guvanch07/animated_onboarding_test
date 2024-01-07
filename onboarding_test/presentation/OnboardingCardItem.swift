//
//  OnboardingCardItem.swift
//  onboarding_test
//
//  Created by Guvanch Amanov on 5.01.24.
//

import SwiftUI



struct OnboardingStackedCard:View {
    @Binding var cards: [Card]
    @Binding var removedCards: [Card]
    let card: Card
    let topSpaceOfEach : CGFloat
    let topCards : CGFloat
    var removeFirst: ()->Void
    var returnFirst: ()->Void
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = .zero
    
    var body: some View {
        CardContentView(card: card)
            .padding([.horizontal,.top], 40)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(color: .gray.opacity(0.8),radius: 3)
            )
            .padding(.bottom,-getPadding())
            .padding(.horizontal,getPadding())
            .zIndex(Double(CGFloat(cards.count) - getIndex()))
            .rotationEffect(.init(degrees: getRotation(angle: 10)))
            .contentShape(Rectangle())
            .offset(x:offset)
            .gesture(
                DragGesture().updating($isDragging,body:{_,out,_ in
                    out = true
                })
                .onChanged({ value in
                    var translation = value.translation.width
                    translation = cards.first?.id == card.id ? translation : 0
                    translation = isDragging ? translation : 0
                    // stop right Swipe
                    translation = (translation < 0 ? translation : 0)
                    offset = translation
                })
                .onEnded({ value in
                    let width = UIScreen.main.bounds.width
                    let cardPassed = -offset > (width / 2)
                    withAnimation(.easeInOut(duration: 0.2)) {
                        if cardPassed{
                            offset = -width
                            removeFirst()
                        }else{
                            print("return")
                            returnFirst()
                            offset = .zero
                        }
                    }
                })
            )
    }
    
    
    func getRotation(angle:Double) -> Double {
        let width = UIScreen.main.bounds.width - 50
        let progress = offset / width
        return Double(progress) * angle
    }
    
    func getPadding() -> CGFloat {
        let maxPadding = topCards * topSpaceOfEach
        let cardPadding = getIndex() * topSpaceOfEach
        return (getIndex() <= topCards ? cardPadding : maxPadding)
    }
    func getIndex() -> CGFloat {
        let index = cards.firstIndex { card in
            return self.card.id == card.id
        } ?? 0
        return CGFloat(index)
    }
    
}

