//
//  GeezmoApp.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)
        return true
    }
}

@main
struct GeezmoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
