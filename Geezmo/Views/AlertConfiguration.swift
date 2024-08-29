//
//  AlertConfiguration.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 04.08.2024.
//

import SwiftUI

struct AlertConfiguration {
    let title: String
    let message: String
    let primaryButton: Alert.Button?
    let secondaryButton: Alert.Button?
}

extension AlertConfiguration {
    static let multicastPermissionsDenied = AlertConfiguration(
        title: Strings.Alerts.MulticastPermissionsDenied.title,
        message: Strings.Alerts.MulticastPermissionsDenied.message,
        primaryButton: .default(
            Text(Strings.Alerts.MulticastPermissionsDenied.primaryButtonTitle),
            action: {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }),
        secondaryButton: nil
    )
}
