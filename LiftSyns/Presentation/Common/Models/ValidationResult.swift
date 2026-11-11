//
//  ValidationResult.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 11/11/2026.
//

import Foundation

enum ValidationResult {
    case success
    case failure(String)
    
    var errorMessage: String? {
        switch self {
        case .success:
            return nil
        case .failure(let message):
            return message
        }
    }
}
