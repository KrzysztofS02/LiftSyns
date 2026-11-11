//
//  LoginViewModel.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 11/11/2026.
//

import SwiftUI
import Foundation
import Combine

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false
    
    private let correctEmail = "Test@gmail.com"
    private let correctPassword = "Test1234"
    
    var emailError: String? {
        if showError {
            return validateEmail().errorMessage
        }
        return nil
    }
    
    var passwordError: String? {
        if showError {
            return validPassword().errorMessage
        }
        return nil
    }
    
    var isFormValid: Bool {
        let emailValid = validateEmail()
        let passwordValid = validPassword()
        
        switch (emailValid, passwordValid) {
        case (.success, .success): return true
        default: return false
        }
    }
    
    func login() {
        if isFormValid {
            
        } else {
            showError = true
        }
    }
    
    private func validateEmail() -> ValidationResult {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        if email.range(of: emailPattern, options: .regularExpression) == nil && email != correctEmail {
            return .failure("Enter a correct Email address")
        }
        return .success
    }
    
    private func validPassword() -> ValidationResult {
        if password.count < 8 && password != correctPassword {
            return .failure("Enter correct Password")
        }
        return .success
    }
}
