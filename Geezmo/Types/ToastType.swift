//
//  ToastType.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

enum ToastType {
    case warning
    case success
    case notification
    case powerOn
    case powerOff
}

extension ToastType {
    var iconColor: Color {
        switch self {
        case .notification:
            return .accent
        case .warning, .powerOff:
            return .red
        case .success, .powerOn:
            return .green
        }
    }

    var systemName: String {
        switch self {
        case .warning:
            return "exclamationmark.circle.fill"
        case .success:
            return "checkmark.circle.fill"
        case .notification:
            return "bell.circle.fill"
        case .powerOn:
            return "bolt.circle.fill"
        case .powerOff:
            return "bolt.slash.circle.fill"
        }
    }

    func getNotificationFeedbackType() -> UINotificationFeedbackGenerator.FeedbackType {
        switch self {
        case .notification:
            return .warning
        case .warning, .powerOff:
            return .error
        case .success, .powerOn:
            return .success
        }
    }
}

