//
//  CustomTextField.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 05/11/2026.
//

import SwiftUI

struct CustomTextField : View {
    @Binding var text: String
    @FocusState var isTaping: Bool
    
    var iconName: String? = nil
    var placeholder: String
    var isPassword: Bool = false
    
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        HStack {
            if let icon = iconName {
                Image(systemName: icon)
                    .foregroundColor(isTaping ? Color.custom.primary : .white)
                    .frame(width: 20)
            }
            
            ZStack(alignment: .leading) {
                if isPassword {
                    if isPasswordVisible {
                        TextField("", text: $text)
                            .foregroundColor(Color.custom.text)
                    } else {
                        SecureField("", text: $text)
                            .foregroundColor(Color.custom.text)
                    }
                } else {
                    TextField("", text: $text)
                        .foregroundColor(Color.custom.text)
                }
                
                Text(placeholder)
                    .padding(.horizontal, 5)
                    .background(Color.custom.background.opacity(isTaping || !text.isEmpty ? 1 : 0))
                    .foregroundColor(isTaping ? Color.custom.primary : .white)
                    .offset(y: isTaping || !text.isEmpty ? -27 : 0)
                    .onTapGesture {
                        isTaping = true
                    }
            }
            
            if isPassword {
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 55)
        .focused($isTaping)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(isTaping ? Color.custom.primary : .custom.text, lineWidth: 2)
        )
        .animation(.easeInOut(duration: 0.2), value: isTaping)
        .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var email = ""
        @State private var password = ""
        
        var body: some View {
            VStack(spacing: 35) {
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
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.custom.background)
        }
    }
    
    return PreviewWrapper()
}
