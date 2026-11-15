//
//  ContentView.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 26/09/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch coordinator.activeScreen {
            case .login:
                LoginView()
            case .home:
                HomeView()
            }
        }
        .animation(.easeInOut, value: coordinator.activeScreen)
        .environmentObject(coordinator)
    }
}

#Preview {
    ContentView()
}
