//
//  ButtonGroup.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct ButtonGroup<Content: View>: View {
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
