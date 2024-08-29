//
//  KeyButtonRow.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct KeyButtonRow<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        HStack(spacing: Globals.buttonSpacing) {
            content()
        }
        .padding(Globals.buttonSpacing)
        .background(.black)
        .cornerRadius(.greatestFiniteMagnitude)
    }
}
