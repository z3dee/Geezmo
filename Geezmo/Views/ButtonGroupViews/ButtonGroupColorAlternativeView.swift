//
//  ButtonGroupColorAlternativeView.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct ButtonGroupColorAlternativeView: View {
    var body: some View {
        KeyButtonGroup {
            KeyButtonRow {
                KeyButton(.powerOff)
                KeyButton(.grid)
                KeyButton(.settings)
            }
            KeyButtonRow {
                KeyButton(.red)
                KeyButton(.green)
                KeyButton(.yellow)
            }
            KeyButtonRow {
                KeyButton(.num4)
                KeyButton(.blue)
                KeyButton(.num6)
            }
            KeyButtonRow {
                KeyButton(.num7)
                KeyButton(.num8)
                KeyButton(.num9)
            }
            KeyButtonRow {
                KeyButton(.screenOff)
                KeyButton(.num0)
                KeyButton(.mute)
            }
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
            KeyButtonRow {
                KeyButton(.channelUpAlternative)
                KeyButton(.playPause)
                KeyButton(.channelDownAlternative)
            }
        }
    }
}

