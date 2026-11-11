//
//  RegisterView.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 11/11/2026.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.custom.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color.custom.primary)
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Create Account")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Join the community and start tracking\nyour gains.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                CustomTextField(text: $viewModel.fName, iconName: "person", placeholder: "Enter your name")
                                if let error = viewModel.fNameError {
                                    Text(error).font(.caption).foregroundStyle(Color.red).padding(.leading, 15)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                CustomTextField(text: $viewModel.email, iconName: "envelope", placeholder: "Enter your email")
                                if let error = viewModel.emailError {
                                    Text(error).font(.caption).foregroundStyle(Color.red).padding(.leading, 15)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                CustomTextField(text: $viewModel.password, iconName: "lock", placeholder: "Password", isPassword: true)
                                if let error = viewModel.passwordError {
                                    Text(error).font(.caption).foregroundStyle(Color.red).padding(.leading, 15)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                CustomTextField(text: $viewModel.confirmPassword, iconName: "questionmark.circle", placeholder: "Confirm password", isPassword: true)
                                if let error = viewModel.confirmPasswordError {
                                    Text(error).font(.caption).foregroundStyle(Color.red).padding(.leading, 15)
                                }
                            }
                        }

                        Button("Sign Up") {
                            viewModel.register()
                        }
                        .buttonStyle(PrimaryButton())
                        .padding(.top, 10)
                        .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterView()
}
