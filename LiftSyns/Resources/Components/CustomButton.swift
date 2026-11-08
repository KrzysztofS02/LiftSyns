//
//  CustomButton.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 24/10/2026.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.custom.primary)
            .cornerRadius(30)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct SecondaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color.custom.text)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.custom.secondary)
            .cornerRadius(30)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

//#Preview {
//    VStack (spacing: 20) {
//        Button("Get Started") {
//            
//        }
//        .buttonStyle(PrimaryButton())
//        
//        Button("Apply") {
//            
//        }
//        .buttonStyle(SecondaryButton())
//    }
//    .padding()
//}
