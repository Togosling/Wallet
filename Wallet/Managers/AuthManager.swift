//
//  AuthManager.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/14.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    func createUser(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func checkAuth() throws {
        guard Auth.auth().currentUser != nil else {
            throw CustomError.notFound
        }
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
}
