//
//  LoginView.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 10/11/2026.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome Back")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Sign in to continue your progress.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .padding(.top, 40)
                
                CustomTextField(
                    text: $email,
                    iconName: "envelope",
                    placeholder: "Email Address"
                )
                
                CustomTextField(
                    text: $password,
                    iconName: "lock",
                    placeholder: "Password",
                    isPassword: true
                )
                
                HStack {
                    Spacer()
                    Button(action: {
                        print("Forgot password tapped")
                    }) {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .foregroundColor(Color.custom.primary)
                    }
                }
                .padding(.bottom, 10)
                
                Button("Sign In") {
                    print("Próba logowania...")
                    print("Email: \(email), Hasło: \(password)")
                }
                .buttonStyle(PrimaryButton())
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: RegisterView()){
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color.custom.primary)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.custom.background.ignoresSafeArea())
        }
    }
}

#Preview {
    LoginView()
}
