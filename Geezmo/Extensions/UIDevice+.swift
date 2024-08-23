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
    
    static var isPlusOrProModel: Bool {
        let screenSize = UIScreen.main.bounds.size
        let maxScreenLength = max(screenSize.width, screenSize.height)
        let largeScreenSizes: [CGFloat] = [736.0, 896.0, 926.0, 932.0] // Heights for Plus and Pro Max models
        return largeScreenSizes.contains(maxScreenLength)
    }
}
