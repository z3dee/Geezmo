//
//  AnalyticsEvents.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 29.08.2024.
//

import Foundation

enum AnalyticsEvents {
    enum MainView: String {
        case mainViewStarted
    }
    
    enum PreferencesView: String {
        case preferencesViewStarted
        case aboutViewStarted
        case faqViewStarted
        case connectTVStarted
        case resetConnectionDataTapped
        case altLayoutTapped
        case hapticFeedbackTapped
    }
    
    enum AppsView: String {
        case appsViewStarted
        case appLaunchTapped
    }
    
    enum General: String {
        case tvConnected
        case tvDisconnected
        case buttonTapped
    }
}
