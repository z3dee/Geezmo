//
//  ButtonGroupColorAlternativeView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct ButtonGroupColorAlternativeView: View {
    var body: some View {
        ButtonGroup {
            ButtonRow {
                KeyButton(.powerOff)
                KeyButton(.grid)
                KeyButton(.settings)
            }
            ButtonRow {
                KeyButton(.red)
                KeyButton(.green)
                KeyButton(.yellow)
            }
            ButtonRow {
                KeyButton(.num4)
                KeyButton(.blue)
                KeyButton(.num6)
            }
            ButtonRow {
                KeyButton(.num7)
                KeyButton(.num8)
                KeyButton(.num9)
            }
            ButtonRow {
                KeyButton(.screenOff)
                KeyButton(.num0)
                KeyButton(.mute)
            }
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
            ButtonRow {
                KeyButton(.channelUpAlternative)
                KeyButton(.playPause)
                KeyButton(.channelDownAlternative)
            }
        }
    }
}

