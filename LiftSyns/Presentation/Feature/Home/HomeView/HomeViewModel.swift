//
//  HomeViewModel.swift
//  LiftSyns
//
//  Created by Krzysztof Stępień on 12/11/2026.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var posts: [PostDetails] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        posts = [
            PostDetails(
                title: "Leg Day",
                owner: Owner(name: "Krzysztof", image: nil),
                dateCreated: Date(),
                workout: Workout(duration: 3600, volume: 4500),
                exercises: [Exercise(title: "Squats"), Exercise(title: "Leg Press"), Exercise(title: "Calf Raises"), Exercise(title: "Lunges")]
            ),
            PostDetails(
                title: "Upper Body Power",
                owner: Owner(name: "Maciek", image: nil),
                dateCreated: Date(),
                workout: Workout(duration: 2700, volume: 3200),
                exercises: [Exercise(title: "Bench Press"), Exercise(title: "Pull-ups")]
            ),
            PostDetails(
                title: "Leg Day Destroyer",
                owner: Owner(name: "Adam", image: nil),
                dateCreated: Date(),
                workout: Workout(duration: 3600, volume: 4500),
                exercises: [Exercise(title: "Squats"), Exercise(title: "Leg Press"), Exercise(title: "Calf Raises"), Exercise(title: "Lunges")]
            ),
            PostDetails(
                title: "Upper",
                owner: Owner(name: "Dawid", image: nil),
                dateCreated: Date(),
                workout: Workout(duration: 2700, volume: 3200),
                exercises: [Exercise(title: "Bench Press"), Exercise(title: "Pull-ups")]
            )
        ]
    }
}
