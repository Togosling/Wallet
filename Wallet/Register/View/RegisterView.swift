//
//  RegisterView.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/12.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var registerViewModel: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Image("dollar")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("Register")
                    .font(.title)
                    .bold()
                
                inputTextFieldsView
                
                continueButton
                
                alternativeRegistrationView
            }
        }
    }
}

extension RegisterView {
    
    private var continueButton: some View {
        Button(action: {
            registerViewModel.signIn()
        }, label: {
            Text("Continue")
                .foregroundStyle(Color.black)
                .font(.title2)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color.customAccent)
                )
        })
        .padding()
    }
    
    private var inputTextFieldsView: some View {
        VStack() {
            HStack(spacing: 8) {
                Image(systemName: "envelope")
                TextField("Email", text: $registerViewModel.email)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(style: StrokeStyle())
                    .foregroundStyle(Color.primary)
            )
            .padding()
            
            HStack(spacing: 8) {
                Image(systemName: "lock")
                SecureField("Password", text: $registerViewModel.password)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(style: StrokeStyle())
                    .foregroundStyle(Color.primary)
            )
            .padding()
        }
        .font(.subheadline)
    }
    
    private var alternativeRegistrationView: some View {
        HStack {
            Button {
                
            } label: {
                Image("facebook")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image("apple-logo")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(Color.primary)
                    .frame(width: 35, height: 35)
            }
            
            Spacer()

            Button {
                
            } label: {
                Image("google")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
        }
        .padding(.horizontal, 80)
    }
}
