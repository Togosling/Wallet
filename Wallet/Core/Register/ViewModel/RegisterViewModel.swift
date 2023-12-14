//
//  RegisterViewModel.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/13.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid: Bool = true
    @Published var isPasswordValid: Bool = true
    
    @MainActor func register() async throws {
        isEmailValid = email.isValidEmail()
        isPasswordValid = password.isValidPassword()
        
        if isEmailValid && isPasswordValid {
            try await AuthManager.shared.createUser(email: email, password: password)
        }
    }
}
