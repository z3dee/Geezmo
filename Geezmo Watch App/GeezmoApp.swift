//
//  GeezmoApp.swift
//  Geezmo Watch App
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

@main
struct GeezmoWatchApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .environmentObject(MainViewModel())
    }
}
