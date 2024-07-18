//
//  PlaybackAlternativeView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct PlaybackAlternativeView: View {
    var body: some View {
        ButtonRow {
            KeyButton(.channelUpAlternative)
            KeyButton(.powerOff)
            KeyButton(.mute)
        }
        ButtonRow {
            KeyButton(.rewind)
            KeyButton(.playPause)
            KeyButton(.fastForward)
        }
        ButtonRow {
            KeyButton(.channelDownAlternative)
            KeyButton(.settings)
            KeyButton(.screenOff)
        }
    }
}

