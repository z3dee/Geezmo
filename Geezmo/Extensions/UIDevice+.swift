//
//  UIDevice+.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 11.08.2024.
//

import SwiftUI

extension UIDevice {
    static var hasNotch: Bool {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return false
        }
        let bottom = windowScene.windows.first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
