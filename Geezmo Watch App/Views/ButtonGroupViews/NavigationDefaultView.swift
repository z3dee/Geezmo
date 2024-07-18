//
//  NavigationDefaultView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct NavigationDefaultView: View {
    var body: some View {
        ButtonRow {
            KeyButton(.channelUp)
            KeyButton(.up)
            KeyButton(.volumeUp)
        }
        ButtonRow {
            KeyButton(.left)
            KeyButton(.ok)
            KeyButton(.right)
        }
        ButtonRow {
            KeyButton(.channelDown)
            KeyButton(.down)
            KeyButton(.volumeDown)
        }
    }
}
