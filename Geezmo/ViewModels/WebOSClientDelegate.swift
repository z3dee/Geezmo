//
//  WebOSClientDelegate.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI
import WebOSClient

extension MainViewModel: WebOSClientDelegate {
    func didPrompt() {
        Task { @MainActor in
            toast(.prompted)
        }
    }
    
    func didDisplayPin() {
        Task { @MainActor in
            pinPadPresented = true
        }
    }

    func didRegister(with clientKey: String) {
        AppSettings.shared.clientKey = clientKey
        subscribeAll()
        Task { @MainActor in
            isConnected = true
            isToastPresented = false
        }
    }

    func didReceive(_ result: Result<WebOSResponse, Error>) {
        if case .success(let response) = result,
           response.id == Globals.SubscriptionIds.remoteKeyboardRequestId,
           let focus = response.payload?.currentWidget?.focus {
            Task { @MainActor in
                keyboardPresented = focus
                isFocused = focus
            }
        }

        if case .success(let response) = result,
           response.id == Globals.SubscriptionIds.mediaPlaybackInfoRequestId,
           let playState = response.payload?.foregroundAppInfo?.first?.playState {
            Task { @MainActor in
                self.playState = playState
            }
        }

        if case .failure(let error) = result {
            print("~err: \(error.localizedDescription)")
        }
        
        if case .failure(let error) = result {
            let errorMessage = error.localizedDescription
            if errorMessage.contains("rejected pairing") || errorMessage.contains("cancelled") {
                connectAndRegister(forcingConnection: true)
            }
        }
    }

    func didReceiveNetworkError(_ error: Error?) {
        if let error = error as NSError? {
            if error.code == 57 || error.code == 60 || error.code == 54 {
                disconnect()
            }
        }
    }
}
