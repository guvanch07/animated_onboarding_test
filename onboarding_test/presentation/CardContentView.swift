//
//  CardContentView.swift
//  onboarding_test
//
//  Created by Guvanch Amanov on 6.01.24.
//

import SwiftUI


struct CardContentView: View {
    let card: Card
    
    var body: some View {
        VStack {
            Image(card.asset)
                .resizable()
                .frame(width: 200, height: 200)
            Text(card.description)
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
            Text(card.actionText)
                .font(.title3)
                .foregroundStyle(.gray)
                .textCase(.uppercase)
                .padding(.bottom,30)
        }
    }
}

