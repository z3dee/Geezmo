//
//  SSDPDiscoveryDelegate.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI
import SSDPClient

extension MainViewModel: SSDPDiscoveryDelegate {
    func ssdpDiscovery(_ discovery: SSDPDiscovery, didDiscoverService service: SSDPService) {
        if let server = service.server, server.contains("LGE WebOS TV"), let deviceName = service.deviceName {
            let newDevice = DeviceData(id: UUID().uuidString, name: deviceName, host: service.host)
            Task { @MainActor in
                devices.insert(newDevice)
            }
        }
    }

    func ssdpDiscoveryDidFinish(_ discovery: SSDPDiscovery) {
        Task { @MainActor in
            deviceDiscoveryFinished = true
        }
    }
}
