//
//  KeyButtonGroup.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct KeyButtonGroup<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing: -Globals.buttonSpacing) {
            Spacer().frame(height: Globals.topPadding)
            content()
        }
        .ignoresSafeArea(.all)
    }
}
