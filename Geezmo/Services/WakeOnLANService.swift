//
//  WakeOnLANService.swift.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 06.08.2024.
//

import Foundation
import Network

class WakeOnLANService {
    static let shared = WakeOnLANService()
    
    private init() {}
    
    private func createMagicPacket(macAddress: String) -> Data? {
        let cleanedMac = macAddress.replacingOccurrences(of: ":", with: "").replacingOccurrences(of: "-", with: "")
        guard cleanedMac.count == 12, let macData = cleanedMac.hexadecimal else {
            print("Invalid MAC address")
            return nil
        }
        var magicPacket = Data(repeating: 0xFF, count: 6)
        for _ in 0 ..< 16 {
            magicPacket.append(macData)
        }
        return magicPacket
    }
    
    func wakeDevice(at ipAddress: String, macAddress: String, port: UInt16 = 9, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let magicPacket = createMagicPacket(macAddress: macAddress) else {
            completion(.failure(WakeOnLanError.invalidMacAddress))
            return
        }
        let connection = NWConnection(host: NWEndpoint.Host(ipAddress), port: NWEndpoint.Port(rawValue: port)!, using: .udp)
        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                connection.send(content: magicPacket, completion: .contentProcessed { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                    connection.cancel()
                })
            case .failed(let error):
                completion(.failure(error))
            default:
                break
            }
        }
        connection.start(queue: .global())
    }
    
    enum WakeOnLanError: Error {
        case invalidMacAddress
    }
}
