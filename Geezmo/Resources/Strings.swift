//
//  Strings.swift
//  Geezmo
//
//  Created by Yaroslav Sedyshev on 18.07.2024.
//

// swiftlint:disable line_length

enum Strings {
    enum Titles {
        static let apps = "#apps".localized
        static let preferences = "#preferences".localized
        static let aboutApp = "#aboutApp".localized
        static let faq = "#faq".localized
        static let rateUs = "#rateUs".localized
        static let connectTV = "#connectTV".localized
        static let manuallyEnterIP = "#manuallyEnterIP".localized
        static let resetConnectionData = "#resetConnectionData".localized
        static let alternativeLayout = "#alternativeLayout".localized
        static let hapticFeedback = "#hapticFeedback".localized
        static let pairingTitle = "#pairingTitle".localized
    }

    enum SectionHeaders {
        static let app = "#app".localized
        static let connection = "#connection".localized
        static let layoutAndHaptics = "#layoutAndHaptics".localized
    }

    enum About {
        static let appInfo = "#appInfo".localized
        static let authorInfo = "#authorInfo".localized
        static let madeWith = "#madeWith".localized
        static let madeIn = "#madeIn".localized
    }
    
    enum Apps {
        static let loadingApps = "#loadingApps".localized
        static let noAppsFound = "#noAppsFound".localized
        static let reload = "#reload".localized
    }

    enum ConnectTV {
        static let discoveredDevices = "#discoveredDevices".localized
        static let importantNote = "#importantNote".localized
        static let notFound = "#notFound".localized
        static let rescan = "#rescan".localized
    }

    enum InputIP {
        static let inputIPMessage = "#inputIPMessage".localized
        static let inputIPPrompt = "#inputIPPrompt".localized
    }

    enum ToastMessages {
        static let prompted = "#prompted".localized
        static let connectedAndRegistered = "#connectedAndRegistered".localized
        static let disconnected = "#disconnected".localized
        static let tvTurnedOn = "#tvTurnedOn".localized
        static let tvGoingOff = "#tvGoingOff".localized
    }

    enum FAQ {
        static let q1 = "#q1".localized
        static let a1 = "#a1".localized
        static let q2 = "#q2".localized
        static let a2 = "#a2".localized
        static let q3 = "#q3".localized
        static let a3 = "#a3".localized
        static let q4 = "#q4".localized
        static let a4 = "#a4".localized
        static let q5 = "#q5".localized
        static let a5 = "#a5".localized
        static let q6 = "#q6".localized
        static let a6 = "#a6".localized
        static let q7 = "#q7".localized
        static let a7 = "#a7".localized
        static let q8 = "#q8".localized
        static let a8 = "#a8".localized
        static let q9 = "#q9".localized
        static let a9 = "#a9".localized
        static let q10 = "#q10".localized
        static let a10 = "#a10".localized
    }

    enum General {
        static let appName = "#appName".localized
        static let shortAppName = "#shortAppName".localized
        static let save = "#save".localized
        static let reset = "#reset".localized
        static let cancel = "#cancel".localized
        static let yourTextHere = "#yourTextHere".localized
        static let error = "#error".localized
    }
    
    enum Alerts {
        enum MulticastPermissionsDenied {
            static let title = "#multicastPermissionsDenied_title".localized
            static let message = "#multicastPermissionsDenied_message".localized
            static let primaryButtonTitle = "#multicastPermissionsDenied_primaryButtonTitle".localized
        }
        
        enum ResetConnectionData {
            static let title = "#resetConnectionData_title".localized
            static let message = "#resetConnectionData_message".localized
        }
    }
}

// swiftlint:enable line_length
