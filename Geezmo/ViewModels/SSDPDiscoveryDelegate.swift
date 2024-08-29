//
//  SSDPDiscoveryDelegate.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import SwiftUI
import SSDPClient

extension MainViewModel: SSDPDiscoveryDelegate {
    func ssdpDiscovery(_ discovery: SSDPDiscovery, didDiscoverService service: SSDPService) {
        services.append(service)
    }

    func ssdpDiscoveryDidFinish(_ discovery: SSDPDiscovery) {
        prepareServices()
        Task { @MainActor in
            deviceDiscoveryFinished = true
        }
    }
    
    private func prepareServices() {
        for service in services {
            if let server = service.server,
               server.contains("TV"),
               let deviceName = service.deviceName,
               let mac = services.filter({
                   $0.host == service.host &&
                   $0.wakeup != nil
               })
                .first?
                .wakeup?
                .extractMacAddress() {
                let newDevice = DeviceData(id: UUID().uuidString, name: deviceName, host: service.host, mac: mac)
                Task { @MainActor in
                    devices.insert(newDevice)
                }
            }
        }
        services = []
    }
}
