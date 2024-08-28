//
//  VolumeView.swift
//  Geezmo Watch App
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI

struct VolumeView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            Slider(
                value: $viewModel.tvVolumeLevel,
                in: 0...100,
                label: {},
                minimumValueLabel: {
                    Image(systemName: "speaker.minus")
                        .foregroundColor(.gray)
                        .font(.system(
                            size: Globals.buttonFontSize,
                            weight: .bold,
                            design: .rounded))
                },
                maximumValueLabel: {
                    Image(systemName: "speaker.plus")
                        .foregroundColor(.gray)
                        .font(.system(
                            size: Globals.buttonFontSize,
                            weight: .bold,
                            design: .rounded))
                })
            .padding()
            .navigationTitle("Volume: \(Int(viewModel.tvVolumeLevel))")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

