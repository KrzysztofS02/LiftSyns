//
//  MainTabView.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 16/11/2026.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.custom.background)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            WorkoutView()
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                    Text("Workout")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .tint(Color.custom.primary)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainTabView()
}
