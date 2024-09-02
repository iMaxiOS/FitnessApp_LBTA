//
//  WorkoutModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct WorkoutModel: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let time: String
    let lvl: String
    let balls: String
    let name: String
    let description: String
    let subtitle: String
    var isFavorite: Bool
    
    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
    
    static var categoryData: [CategoryType: [WorkoutModel]] = [
        .workouts: [
            WorkoutModel(image: "pic 1", title: "Home Chest Workout (No Equipment)", time: "45", lvl: "🔥 Hard", balls: "3.5", name: "Richard Smith", description: "5 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 5", title: "Copenhagen Side Plank Knee Tuck", time: "45", lvl: "🔥🔥🔥 Hard", balls: "1.5", name: "Klara Becton", description: "2 years experience", subtitle: "Functional Strength", isFavorite: false),
            WorkoutModel(image: "pic 6", title: "The Chaos Pallor Press", time: "25", lvl: "🔥🔥 Middle", balls: "2.8", name: "Joshua Metis", description: "4 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 7", title: "Common Chaos Pallor Press Mistakes and Fixes", time: "15", lvl: "🔥 Easy", balls: "3.1", name: "Magi Smith", description: "6 years experience", subtitle: "High Intensity Fitness Training", isFavorite: false),
            WorkoutModel(image: "pic 8", title: "You’re Over Arching Your Back", time: "35", lvl: "🔥🔥 Middle", balls: "3.6", name: "Richard Pols", description: "3 years experience", subtitle: "Functional Strength", isFavorite: false)
        ],
        .fitness: [
            WorkoutModel(image: "pic 4", title: "Perfect Home Shoulder Workout", time: "15", lvl: "🔥 Easy", balls: "4.0", name: "Ronald Chief", description: "9 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 5", title: "Copenhagen Side Plank Knee Tuck", time: "45", lvl: "🔥🔥🔥 Hard", balls: "1.5", name: "Klara Becton", description: "2 years experience", subtitle: "Functional Strength", isFavorite: false),
            WorkoutModel(image: "pic 6", title: "The Chaos Pallor Press", time: "25", lvl: "🔥🔥 Middle", balls: "2.8", name: "Joshua Metis", description: "4 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 7", title: "Common Chaos Pallor Press Mistakes and Fixes", time: "15", lvl: "🔥 Easy", balls: "3.1", name: "Magi Smith", description: "6 years experience", subtitle: "High Intensity Fitness Training", isFavorite: false),
            WorkoutModel(image: "pic 8", title: "You’re Over Arching Your Back", time: "35", lvl: "🔥🔥 Middle", balls: "3.6", name: "Richard Pols", description: "3 years experience", subtitle: "Functional Strength", isFavorite: false)
        ],
        .plans: [
            WorkoutModel(image: "pic 3", title: "Total Body Strength Burnout (No Weights)", time: "55", lvl: "🔥🔥🔥 Hard", balls: "4.6", name: "Chris Hernia", description: "7 years experience", subtitle: "High Intensity Fitness Training", isFavorite: false),
            WorkoutModel(image: "pic 4", title: "Perfect Home Shoulder Workout", time: "15", lvl: "🔥 Easy", balls: "4.0", name: "Ronald Chief", description: "9 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 5", title: "Copenhagen Side Plank Knee Tuck", time: "45", lvl: "🔥🔥🔥 Hard", balls: "1.5", name: "Klara Becton", description: "2 years experience", subtitle: "Functional Strength", isFavorite: false),
            WorkoutModel(image: "pic 6", title: "The Chaos Pallor Press", time: "25", lvl: "🔥🔥 Middle", balls: "2.8", name: "Joshua Metis", description: "4 years experience", subtitle: "High Intensity Training", isFavorite: false)
        ],
        .trainers: [
            WorkoutModel(image: "pic 6", title: "Total Body Strength Burnout (No Weights)", time: "55", lvl: "🔥🔥🔥 Hard", balls: "4.6", name: "Chris Hernia", description: "7 years experience", subtitle: "High Intensity Fitness Training", isFavorite: false),
            WorkoutModel(image: "pic 4", title: "Perfect Home Shoulder Workout", time: "15", lvl: "🔥 Easy", balls: "4.0", name: "Ronald Chief", description: "9 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 5", title: "Copenhagen Side Plank Knee Tuck", time: "45", lvl: "🔥🔥🔥 Hard", balls: "1.5", name: "Klara Becton", description: "2 years experience", subtitle: "Functional Strength", isFavorite: false),
            WorkoutModel(image: "pic 3", title: "The Chaos Pallor Press", time: "25", lvl: "🔥🔥 Middle", balls: "2.8", name: "Joshua Metis", description: "4 years experience", subtitle: "High Intensity Training", isFavorite: false),
            WorkoutModel(image: "pic 7", title: "Common Chaos Pallor Press Mistakes and Fixes", time: "15", lvl: "🔥 Easy", balls: "3.1", name: "Magi Smith", description: "6 years experience", subtitle: "High Intensity Fitness Training", isFavorite: false),
            WorkoutModel(image: "pic 8", title: "You’re Over Arching Your Back", time: "35", lvl: "🔥🔥 Middle", balls: "3.6", name: "Richard Pols", description: "3 years experience", subtitle: "Functional Strength", isFavorite: false)
        ]
    ]
}
