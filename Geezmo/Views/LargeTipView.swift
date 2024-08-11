//
//  LargeTipView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 11.08.2024.
//


import SwiftUI

struct LargeTipView: View {
    @State private var animateSymbol: Bool = false

    var systemName: String
    var color: Color
    var message: String

    var body: some View {
        VStack {
            Image(systemName: systemName)
                .font(.system(size: 64, weight: .light, design: .rounded))
                .foregroundStyle(.primary, color)
                .symbolEffect(.bounce.up.byLayer, value: animateSymbol)
                .onAppear {
                    animateSymbol.toggle()
                }

            Spacer().frame(height: 25)

            Text(message)
                .font(.system(size: Globals.bodyFontSize, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineSpacing(Globals.lineHeight)
                .padding([.leading, .trailing], 50)
        }
    }
}

