//
//  NavigationAlternativeView.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct NavigationAlternativeView: View {
    var body: some View {
        KeyButtonRow {
            KeyButton(.homeAlternative)
            KeyButton(.up)
            KeyButton(.volumeUp)
        }
        KeyButtonRow {
            KeyButton(.left)
            KeyButton(.ok)
            KeyButton(.right)
        }
        KeyButtonRow {
            KeyButton(.backAlternative)
            KeyButton(.down)
            KeyButton(.volumeDown)
        }
    }
}

