//
//  ButtonGroupDefaultView.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct ButtonGroupDefaultView: View {
    var body: some View {
        KeyButtonGroup {
            KeyButtonRow {
                KeyButton(.powerOff)
                KeyButton(.grid)
                KeyButton(.settings)
            }
            KeyButtonRow {
                KeyButton(.num1)
                KeyButton(.num2)
                KeyButton(.num3)
            }
            KeyButtonRow {
                KeyButton(.num4)
                KeyButton(.num5)
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
                KeyButton(.channelUp)
                KeyButton(.up)
                KeyButton(.volumeUp)
            }
            KeyButtonRow {
                KeyButton(.left)
                KeyButton(.ok)
                KeyButton(.right)
            }
            KeyButtonRow {
                KeyButton(.channelDown)
                KeyButton(.down)
                KeyButton(.volumeDown)
            }
            KeyButtonRow {
                KeyButton(.home)
                KeyButton(.playPause)
                KeyButton(.back)
            }
        }
    }
}

