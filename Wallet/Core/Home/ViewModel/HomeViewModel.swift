//
//  HomeViewModel.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/14.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var showRegisterView: Bool = false
    
    @MainActor func checkAuth() {
        do {
            try AuthManager.shared.checkAuth()
            showRegisterView = false
        } catch {
            print(error.localizedDescription)
            showRegisterView = true
        }
    }
    
    @MainActor func logout() {
        do {
            try AuthManager.shared.logout()
            showRegisterView = true
        } catch {
            print(error.localizedDescription)
            showRegisterView = false
        }
    }
}
