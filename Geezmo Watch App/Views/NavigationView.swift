//
//  NavigationView.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            KeyButtonGroup {
                if viewModel.preferencesAlternativeView {
                    NavigationAlternativeView()
                } else {
                    NavigationDefaultView()
                }
            }
            .navigationTitle(Strings.Titles.navigationViewTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
