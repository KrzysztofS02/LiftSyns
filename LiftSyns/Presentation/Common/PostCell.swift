//
//  PostCell.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 13/11/2026.
//

import SwiftUI

struct PostCell: View {
    let post: PostDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(String(post.owner.name.prefix(1)))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.owner.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(post.dateCreated, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            
            Text(post.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.custom.primary)
            
            HStack {
                Text("\(post.workout.duration / 60) min")
                Spacer()
                Text("\(post.workout.volume) kg")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            
            Text(post.exercises.map { $0.title }.joined(separator: ", "))
                .font(.footnote)
                .foregroundColor(.white)
                .lineLimit(2)
        }
        .padding()
        .background(Color(white: 0.1))
        .cornerRadius(12)
        .padding(.horizontal, 24)
    }
}
