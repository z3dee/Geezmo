//
//  PlaybackView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct PlaybackView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            ButtonGroup {
                if viewModel.preferencesAlternativeView {
                    PlaybackAlternativeView()
                } else {
                    PlaybackDefaultView()
                }
            }
            .navigationTitle(Strings.Titles.playbackViewTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
