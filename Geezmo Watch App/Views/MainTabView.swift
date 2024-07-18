//
//  MainTabView.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct MainTabView: View {
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject var viewModel: MainViewModel
    @State private var selection: TabSelection

    var body: some View {
        TabView(selection: $selection) {
            NavigationView()
                .tag(TabSelection.navigation)
            PlaybackView()
                .tag(TabSelection.playback)
            PreferencesView()
                .tag(TabSelection.preferences)
        }
        .background(.geezmoDarkGray)
        .tabViewStyle(.verticalPage)
        .ignoresSafeArea(.all)
        .sheet(isPresented: $viewModel.isVolumeViewPresented) {
            VolumeView()
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .active:
                viewModel.sendWakeUpMessage()
            default:
                break
            }
        }
    }

    init(selection: TabSelection = .navigation) {
        self.selection = .navigation
    }

    enum TabSelection {
        case navigation
        case playback
        case preferences
    }
}
