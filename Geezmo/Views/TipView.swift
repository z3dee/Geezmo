//
//  TipView.swift.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct TipView: View {
    @State private var animateSymbol: Bool = false

    var systemName: String
    var color: Color
    var message: String

    var body: some View {
        VStack {
            Image(systemName: systemName)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(.white, color)
                .symbolEffect(.bounce.up.byLayer, value: animateSymbol)
                .onAppear {
                    animateSymbol.toggle()
                }

            Spacer().frame(height: 10)

            Text(message)
                .font(.system(size: Globals.bodyFontSize, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineSpacing(Globals.lineHeight)
                .padding([.leading, .trailing], 50)
        }
    }
}
