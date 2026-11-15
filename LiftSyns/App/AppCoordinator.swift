//
//  AppCoordinator.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 14/11/2026.
//

import SwiftUI
import Foundation
import Combine

enum AppScreen {
    case login
    case home
}

@MainActor
class AppCoordinator: ObservableObject {
    @Published var activeScreen: AppScreen = .login
}
