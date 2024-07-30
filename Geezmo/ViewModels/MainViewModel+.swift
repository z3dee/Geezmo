//
//  MainViewModel+.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI
import WebOSClient

extension MainViewModel {
    func connectAndRegister(forcingConnection: Bool = false) {
        guard let host = AppSettings.shared.host,
              let url = URL(string: "wss://\(host):3001"),
              !isConnected || forcingConnection 
        else { return }

        tv = WebOSClient(
            url: url,
            delegate: self,
            shouldPerformHeartbeat: true,
            heartbeatTimeInterval: 5,
            shouldLogActivity: false
        )

        tv?.connect()
        tv?.send(
            .register(pairingType: .pin, clientKey: AppSettings.shared.clientKey),
            id: Globals.SubscriptionIds.registrationRequestId
        )
    }

    func disconnect() {
        tv?.disconnect()
        Task { @MainActor in
            isConnected = false
        }
    }

    func handleScenePhase(_ scenePhase: ScenePhase) {
        switch scenePhase {
        case .active: connectAndRegister(forcingConnection: true)
        case .background: disconnect()
        default: break
        }
    }

    func discoverDevices() {
        deviceDiscoveryFinished = false
        devices.removeAll()
        ssdpClient.discoverService()
    }

    func subscribeAll() {
        tv?.send(
            .registerRemoteKeyboard,
            id: Globals.SubscriptionIds.remoteKeyboardRequestId
        )

        tv?.send(
            .getForegroundAppMediaStatus(subscribe: true),
            id: Globals.SubscriptionIds.mediaPlaybackInfoRequestId
        )
    }
    
    func showConnectionStatus() {
        toast(isConnected ? .connected : .disconnected)
    }
    
    func pairDiscoveredDevice(with host: String) {
        disconnect()
        AppSettings.shared.host = host
        AppSettings.shared.clientKey = nil
        preferencesPresented = false
        connectAndRegister(forcingConnection: true)
    }

    func resetConnectionData() {
        disconnect()
        AppSettings.shared.host = nil
        AppSettings.shared.clientKey = nil
        preferencesPresented = false
        DispatchQueue.main.asyncAfter(deadline: .now() + Globals.TimeIntervals.medium) { [weak self] in
            guard let self else { return }
            preferencesPresented = true
        }
    }

    func setHostManually(host: String) {
        disconnect()
        AppSettings.shared.host = host
        AppSettings.shared.clientKey = nil
        preferencesPresented = false
        connectAndRegister(forcingConnection: true)
    }
}
