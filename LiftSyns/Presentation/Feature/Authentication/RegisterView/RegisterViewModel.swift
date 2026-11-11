//
//  RegisterViewModel.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 11/11/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class RegisterViewModel: ObservableObject {
    @Published var fName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showError = false
    
    var fNameError: String? {
        if showError { return validateFname().errorMessage }
        return nil
    }
    
    var emailError: String? {
        if showError { return validateEmail().errorMessage }
        return nil
    }
    
    var passwordError: String? {
        if showError { return validatePassword().errorMessage }
        return nil
    }
    
    var confirmPasswordError: String? {
        if showError { return validateConfirmPassword().errorMessage }
        return nil
    }
    
    var isFormValid: Bool {
        let fNameValid = validateFname()
        let emailValid = validateEmail()
        let passValid = validatePassword()
        let confirmValid = validateConfirmPassword()
        
        switch (fNameValid, emailValid, passValid, confirmValid) {
        case (.success, .success, .success, .success): return true
        default: return false
        }
    }
    
    func register() {
        if isFormValid {
            
        } else {
            showError = true
        }
    }
    
    private func validateFname() -> ValidationResult {
        fName.isEmpty ? .failure("Name is required") : .success
    }
    
    private func validateEmail() -> ValidationResult {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        if email.range(of: emailPattern, options: .regularExpression) == nil {
            return .failure("Enter a valid email")
        }
        return .success
    }
    
    private func validatePassword() -> ValidationResult {
        if password.count < 8 {
            return .failure("Password must be at least 8 characters")
        }
        return .success
    }
    
    private func validateConfirmPassword() -> ValidationResult {
        if confirmPassword.isEmpty {
            return .failure("Please confirm password")
        }
        if confirmPassword != password {
            return .failure("Passwords do not match")
        }
        return .success
    }
}
