//
//  PlaybackDefaultView.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct PlaybackDefaultView: View {
    var body: some View {
        KeyButtonRow {
            KeyButton(.screenOff)
            KeyButton(.powerOff)
            KeyButton(.mute)
        }
        KeyButtonRow {
            KeyButton(.rewind)
            KeyButton(.playPause)
            KeyButton(.fastForward)
        }
        KeyButtonRow {
            KeyButton(.home)
            KeyButton(.settings)
            KeyButton(.back)
        }
    }
}

