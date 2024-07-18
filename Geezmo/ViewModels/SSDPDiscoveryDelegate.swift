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
        if let searchTarget = service.searchTarget,
           searchTarget.contains("tv"),
           !devices.map({ $0.name }).contains("WebOS TV") {
            let device = DeviceData(id: UUID().uuidString, name: "WebOS TV", host: service.host)
            Task { @MainActor in
                devices.append(device)
            }
        }
    }

    func ssdpDiscoveryDidFinish(_ discovery: SSDPDiscovery) {
        Task { @MainActor in
            deviceDiscoveryFinished = true
        }
    }
}

