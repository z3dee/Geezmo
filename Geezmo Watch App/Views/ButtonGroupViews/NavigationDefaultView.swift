//
//  NavigationDefaultView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct NavigationDefaultView: View {
    var body: some View {
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
    }
}
