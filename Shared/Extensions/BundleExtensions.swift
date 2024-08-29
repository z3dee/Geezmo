//
//  BundleExtensions.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
    }
    var buildVersionNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }
}
