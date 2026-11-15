//
//  PostDetails.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 13/11/2026.
//

import Foundation

struct PostDetails: Identifiable {
    let id = UUID()
    let title: String
    let owner: Owner
    let dateCreated: Date
    let workout: Workout
    let exercises: [Exercise]
}
