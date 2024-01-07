//
//  BottomActionView.swift
//  onboarding_test
//
//  Created by Guvanch Amanov on 6.01.24.
//

import SwiftUI

struct BottomActionView: View {
    let isFirst: Bool
    var next: ()->Void
    var back: ()->Void
    var body: some View {
        if isFirst{
            first()
        }else{
            afterFirst()
        }
        
    }
    func first() -> some View{
        HStack{
            Spacer()
            Text("INIZIA")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .onTapGesture {
                    next()
                }
        }.padding(.horizontal,30)
            .frame(maxWidth: .infinity - 6,maxHeight: 80,alignment: .center)
            .background(
                LinearGradient(gradient: Gradient(colors: [.orange,.orange, .yellow]), startPoint: .leading, endPoint: .trailing)
            )
    }
    func afterFirst() -> some View{
        HStack{
            Text("RIFIUTA")
                .foregroundStyle(.gray)
                .font(.system(size: 16, weight: .bold, design: .default))
                .onTapGesture {
                    back()
                }
            Spacer()
            Text("ACCETTA")
                .foregroundStyle(.orange)
                .font(.system(size: 16, weight: .bold, design: .default))
                .onTapGesture {
                    next()
                }
        }.padding(.horizontal,30)
            .frame(maxWidth: .infinity - 6,maxHeight: 80,alignment: .center)
            .background( Rectangle()
                    .fill(.white)
                    .shadow(color: .gray,radius: 3)
            )
    }
}

