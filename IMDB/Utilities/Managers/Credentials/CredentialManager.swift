//
//  CredentialManager.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 04/04/2022.
//

import Foundation

final class CredentialManager {
    static let shared = CredentialManager()
    
    private init() {}
    
    var servicesClientId: String {
        return "R7s7Bf46y11kk8i2dQX8YlH6w0cz20iuyLNXfvMd4bo"
    }
    
    var userName: String? {
        return fetchItem(for: .username)
    }
}

private extension CredentialManager {
    func fetchItem(for service: KeychainKey) -> String? {
        do {
            return try KeychainManager.shared.fetch(service: service.value).utfString
        } catch KeychainError.itemNotFound {
            print("Service: \(service.rawValue) not found in Keychain")
        } catch KeychainError.invalidItemFormat {
            print("Service: \(service.rawValue) does not apply data format")
        } catch KeychainError.unexpectedStatus(let status) {
            print("Service: \(service.rawValue) did fail while fetching with an unexpected status code: \(status)")
        } catch {
            print("Service: \(service.rawValue) did fail while fetching")
        }
        
        return nil
    }
    
    func saveItem(data: String, service: KeychainKey) {
        do {
            try KeychainManager.shared.save(data: data, service: service.value)
        } catch KeychainError.unexpectedStatus(let status) {
            print("Service: \(service.rawValue) did fail while saving with an unexpected status code: \(status)")
        } catch {
            print("Service: \(service.rawValue) did fail while saving")
        }
    }
    
    func delete(service: KeychainKey) {
        do {
            try KeychainManager.shared.delete(service: service.value)
        } catch KeychainError.unexpectedStatus(let status) {
            print("Service: \(service.rawValue) did fail while deleting with an unexpected status code: \(status)")
        } catch {
            print("Service: \(service.rawValue) did fail while deleting")
        }
    }
}
