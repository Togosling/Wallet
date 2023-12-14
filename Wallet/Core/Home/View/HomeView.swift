//
//  HomeView.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/14.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
        
    var body: some View {
        VStack {
            Image("dollar")
                .resizable()
                .frame(width: 100, height: 100)
                .onTapGesture {
                    homeViewModel.logout()
                }
        }
        .sheet(isPresented: $homeViewModel.showRegisterView, content: {
            RegisterView()
                .interactiveDismissDisabled()
        })
        .onAppear(perform: {
            homeViewModel.checkAuth()
        })
    }
}

#Preview {
    HomeView()
}
