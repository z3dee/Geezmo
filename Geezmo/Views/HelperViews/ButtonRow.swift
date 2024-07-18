//
//  ButtonRow.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct ButtonRow<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        HStack(spacing: Globals.buttonSpacing) {
            content()
        }
        .padding(Globals.buttonSpacing)
        .background(.geezmoDarkerGray)
        .cornerRadius(.greatestFiniteMagnitude)
    }
}

