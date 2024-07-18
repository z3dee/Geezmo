//
//  NavigationAlternativeView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct NavigationAlternativeView: View {
    var body: some View {
        ButtonRow {
            KeyButton(.homeAlternative)
            KeyButton(.up)
            KeyButton(.volumeUp)
        }
        ButtonRow {
            KeyButton(.left)
            KeyButton(.ok)
            KeyButton(.right)
        }
        ButtonRow {
            KeyButton(.backAlternative)
            KeyButton(.down)
            KeyButton(.volumeDown)
        }
    }
}

