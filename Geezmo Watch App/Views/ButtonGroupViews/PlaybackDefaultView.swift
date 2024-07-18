//
//  PlaybackDefaultView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct PlaybackDefaultView: View {
    var body: some View {
        ButtonRow {
            KeyButton(.screenOff)
            KeyButton(.powerOff)
            KeyButton(.mute)
        }
        ButtonRow {
            KeyButton(.rewind)
            KeyButton(.playPause)
            KeyButton(.fastForward)
        }
        ButtonRow {
            KeyButton(.home)
            KeyButton(.settings)
            KeyButton(.back)
        }
    }
}

