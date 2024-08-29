//
//  DeviceData.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import Foundation

struct DeviceData: Hashable, Identifiable {
    static func == (lhs: DeviceData, rhs: DeviceData) -> Bool {
        lhs.host == rhs.host
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(host)
    }
    
    let id: String
    let name: String
    let host: String
    let mac: String
}
