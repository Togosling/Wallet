//
//  RegisterView.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/12.
//

import SwiftUI

struct RegisterView: View {
        
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var registerViewModel: RegisterViewModel = RegisterViewModel()
    
    @State private var registerError: Error?
        
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
                
                registerButton
                
                alternativeRegistrationView
            }
        }
        .alert(registerError?.localizedDescription ?? "", isPresented: registerError == nil ?  .constant(false) : .constant(true), actions: {})
    }
}

extension RegisterView {
    
    private var registerButton: some View {
        Button(action: {
            Task {
                do {
                    try await registerViewModel.register()
                    dismiss()
                } catch {
                    registerError = error
                }
            }
        }, label: {
            Text("Register")
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
        .padding(.horizontal)
    }
    
    private var inputTextFieldsView: some View {
        VStack {
            VStack {
                HStack(spacing: 8) {
                    Image(systemName: "envelope")
                    TextField("Email", text: $registerViewModel.email)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .stroke(style: StrokeStyle())
                        .foregroundStyle(registerViewModel.isEmailValid ? Color.primary : Color.red)
                )
                
                Text("Invalid Email")
                    .foregroundStyle(Color.red)
                    .opacity(registerViewModel.isEmailValid ? 0.0 : 1.0)
            }
            
            VStack {
                HStack(spacing: 8) {
                    Image(systemName: "lock")
                    SecureField("Password", text: $registerViewModel.password)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .stroke(style: StrokeStyle())
                        .foregroundStyle(registerViewModel.isPasswordValid ? Color.primary : Color.red)
                )
                
                Text("Invalid Password")
                    .foregroundStyle(Color.red)
                    .opacity(registerViewModel.isPasswordValid ? 0.0 : 1.0)
            }
        }
        .font(.subheadline)
        .padding(.horizontal)
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
        .padding(.vertical)
    }
}
