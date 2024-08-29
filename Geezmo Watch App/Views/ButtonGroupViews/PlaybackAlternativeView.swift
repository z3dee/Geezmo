//
//  PlaybackAlternativeView.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct PlaybackAlternativeView: View {
    var body: some View {
        KeyButtonRow {
            KeyButton(.channelUpAlternative)
            KeyButton(.powerOff)
            KeyButton(.mute)
        }
        KeyButtonRow {
            KeyButton(.rewind)
            KeyButton(.playPause)
            KeyButton(.fastForward)
        }
        KeyButtonRow {
            KeyButton(.channelDownAlternative)
            KeyButton(.settings)
            KeyButton(.screenOff)
        }
    }
}

