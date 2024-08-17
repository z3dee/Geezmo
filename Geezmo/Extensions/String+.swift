//
//  String+.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 06.08.2024.
//

import Foundation
import WebOSClient

extension String {
    var hexadecimal: Data? {
        var data = Data(capacity: count / 2)
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSRange(startIndex..., in: self)) { match, _, _ in
            let byteString = (self as NSString).substring(with: match!.range)
            let num = UInt8(byteString, radix: 16)!
            data.append(num)
        }
        return data.count > 0 ? data : nil
    }
    
    func extractMacAddress() -> String? {
        let macAddressPattern = "([0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2})"
        
        do {
            let regex = try NSRegularExpression(pattern: macAddressPattern)
            if let match = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
                if let range = Range(match.range, in: self) {
                    return String(self[range])
                }
            }
        } catch {
            print("Invalid regular expression: \(error.localizedDescription)")
        }
        return nil
    }
    
    func toInitials() -> String {
        let cleanedString = self.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
        let words = cleanedString.split(separator: " ")
        if words.count == 1 {
            return String(words[0].prefix(1))
                .uppercased()
                .replacingOccurrences(of: "-", with: "")
        }
        let firstInitial = words[0].prefix(1).uppercased()
        let secondInitial = words[1].prefix(1).uppercased()
        return (firstInitial + secondInitial).replacingOccurrences(of: "-", with: "")
    }
}
