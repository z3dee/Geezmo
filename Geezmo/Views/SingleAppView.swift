//
//  SingleAppView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 17.08.2024.
//

import SwiftUI
import WebOSClient

struct SingleAppView: View {
    let app: WebOSResponseApplication
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            Button(app.title ?? "N/A", action: {
                if let appId = app.id {
                    viewModel.launchApp(id: appId)
                    if viewModel.preferencesHapticFeedback {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    }
                }
            })
            .buttonStyle(AccentButtonStyle(app: app, viewModel: viewModel))
        }
    }
}

struct AccentButtonStyle: ButtonStyle {
    var app: WebOSResponseApplication
    @ObservedObject var viewModel: MainViewModel
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Circle()
                .foregroundColor(configuration.isPressed ? .accent : Color(uiColor: .systemGray5))
                .frame(width: (UIScreen.main.bounds.width - 200) / 3, height: (UIScreen.main.bounds.width - 200) / 3)
                .scaleEffect(configuration.isPressed ? 3.0 : 1.0)
                .overlay(
                    Text(app.title?.toInitials() ?? "N/A")
                        .font(.system(size: configuration.isPressed ? 36 : 18, weight: .bold, design: .rounded))
                        .foregroundStyle(configuration.isPressed ? .white : .primary)
                        .multilineTextAlignment(.center)
                )
            
            Text(app.title ?? "N/A")
                .font(.system(size: Globals.smallTitleSize, weight: .bold, design: .rounded))
                .foregroundStyle(configuration.isPressed ? .white : .primary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
        .frame(width: (UIScreen.main.bounds.width - 60) / 3, height: (UIScreen.main.bounds.width - 60) / 3)
        .background(Color(uiColor: .systemGray4))
        .cornerRadius(12)
        .animation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.1), value: configuration.isPressed)
        .onChange(of: configuration.isPressed) {
            if configuration.isPressed {
                if viewModel.preferencesHapticFeedback {
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                }
            }
        }
    }
}
