//
//  AppSettings.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import Foundation
import Foil

final class AppSettings {
    static let shared = AppSettings()
    
    private init() {}

    @FoilDefaultStorageOptional(key: "deviceName")
    var deviceName: String?
    
    @FoilDefaultStorageOptional(key: "host")
    var host: String?
    
    @FoilDefaultStorageOptional(key: "mac")
    var mac: String?

    @FoilDefaultStorageOptional(key: "clientKey")
    var clientKey: String?

    @FoilDefaultStorage(key: "phoneAlternativeView")
    var phoneAlternativeView: Bool = false

    @FoilDefaultStorage(key: "phoneHaptics")
    var phoneHaptics: Bool = true

    @FoilDefaultStorage(key: "watchAlternativeView")
    var watchAlternativeView: Bool = false

    @FoilDefaultStorage(key: "watchHaptics")
    var watchHaptics: Bool = true
}
