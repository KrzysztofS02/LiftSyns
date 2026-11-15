//
//  HomeView.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 12/11/2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                        .foregroundColor(Color.custom.primary)
                }
                .padding(.trailing, 8)
                
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(Color.custom.primary)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 15)
            .padding(.top, 10)
            .background(Color.custom.background)
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.posts) { post in
                        PostCell(post: post)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 30)
            }
            .background(Color.custom.background)
        }
        .background(Color.custom.background)
    }
}

#Preview {
    HomeView()
}
