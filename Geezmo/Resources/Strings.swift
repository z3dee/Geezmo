//
//  Strings.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

// swiftlint:disable line_length

enum Strings {
    enum Titles {
        static let preferences = "Preferences"
        static let aboutApp = "About Geezmo"
        static let faq = "Frequently Asked Questions"
        static let connectTV = "Connect TV"
        static let manuallyEnterIP = "Input IP address manually"
        static let resetConnectionData = "Reset connection data"

        static let alternativeLayout = "Alternative layout"
        static let hapticFeedback = "Haptic feedback"
        
        static let pairingTitle = "Pairing Code"
    }

    enum SectionHeaders {
        static let app = "App"
        static let connection = "Connection"
        static let layoutAndHaptics = "Layout and haptics"
    }

    enum About {
        static let appInfo = "LG Smart TV Remote Control App"
        static let authorInfo = "by Yaroslav Sedyshev"
        static let madeWith = "Made with"
        static let madeIn = "in Kazakhstan"
        static let kzFlag = "🇰🇿"
    }

    enum ConnectTV {
        static let importantNote = "TV must be on and connected to the same network"
    }

    enum InputIP {
        static let inputIPMessage = "IP address of your TV"
        static let inputIPPrompt = "IP address"
    }

    enum ResetConnectionData {
        static let title = "Do you want to reset connection data?"
        static let message = "You will need to reconnect and re-register with the TV."
    }

    enum ToastMessages {
        static let prompted = "Please accept the registration prompt on the TV"
        static let connectedAndRegistered = "Successfully connected and registered with the TV"
        static let disconnected = "Disconnected, tap any button to reconnect"
        static let tvGoingOff = "The TV is going off, tap power button to turn it on again"
    }

    enum FAQ {
        static let q1 = "Do you have a companion Apple Watch app?"
        static let a1 = "Yes, Geezmo comes with a fantastic companion app specifically designed for the Apple Watch. Check it out!"
        
        static let q2 = "Can I customize the button layout?"
        static let a2 = "Currently, customization options are somewhat limited. Geezmo offers a basic layout and an alternative layout, which you can switch between in the settings menu."
        
        static let q3 = "Can I hold a button for a continuous action?"
        static let a3 = "Yes, certain button types such as volume controls and arrow keys support continuous actions when held down."
        
        static let q4 = "How do I troubleshoot connection issues?"
        static let a4 = "Ensure that both your iPhone and your TV are connected to the same WiFi network and that you have granted local network permissions to Geezmo. This is essential for the app to function properly."
        
        static let q5 = "Does Geezmo support voice commands?"
        static let a5 = "No, currenlty Geezmo does not support voice commands."
        
        static let q6 = "Can I use Geezmo with multiple TVs?"
        static let a6 = "No, not in the current version. Connecting to a different TV will reset the previously stored connection data."
        
        static let q7 = "Is there an Android version available?"
        static let a7 = "No, currently, Geezmo is only available for iOS devices."
        
        static let q8 = "Is Geezmo free and open source?"
        static let a8 = "Yes, Geezmo is completely free and always will be. Additionally, it is open-source. Please visit our GitHub repository at"
        
        static let q9 = "Questions? Comments?"
        static let a9 = "Please contact the author at"
    }

    enum General {
        static let appName = "Geezmo App"
        static let shortAppName = "Geezmo"
        static let save = "Save"
        static let reset = "Reset"
        static let cancel = "Cancel"
        static let yourTextHere = "Enter text here..."
    }
    
    enum Alerts {
        enum MulticastPermissionsDenied {
            static let title = "Permission Denied"
            static let message = "Multicast networking permissions are required to discover and connect to your TV. Please enable these permissions in Settings → Privacy & Security → Local Network."
            static let primaryButtonTitle = "Open Settings"
        }
    }
}

// swiftlint:enable line_length

