//
//  StringExtensions.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import Foundation

extension String {
    static let commonTarget = "sendCommon"
    static let keyTarget = "sendKey"
    static let service = "service"
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
