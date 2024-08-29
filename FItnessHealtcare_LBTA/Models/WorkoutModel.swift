//
//  WorkoutModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct HomeWorkoutModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let kilometer: String
    
    static let homeWorkoutMock: [HomeWorkoutModel] = [
        .init(image: "figure.walk", title: "Indoor Walk", kilometer: "2.44 km"),
        .init(image: "figure.run", title: "Morning Running", kilometer: "3.88 km"),
        .init(image: "figure.open.water.swim", title: "Swimming", kilometer: "1.88 km"),
    ]
}


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

struct WorkoutDetailModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    
    static let mockDetail: [WorkoutDetailModel] = [
        .init(image: "pic 8", title: "Push Ups", description: "20 reps"),
        .init(image: "pic 7", title: "90º Hold", description: "20 sec"),
        .init(image: "pic 3", title: "Push Ups in a Circle", description: "8 reps both directions"),
        .init(image: "pic 4", title: "Archer Push Ups", description: "10 reps on each side"),
        .init(image: "pic 5", title: "Explosive neg. Push Ups", description: "15 reps"),
        .init(image: "pic 6", title: "Incline Diamond Push Ups", description: "15 sec")
    ]
}

struct MealDetailModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    
    static let mockDetail: [WorkoutDetailModel] = [
        .init(image: "meal 8", title: "Step 1", description: "Preheat oven to 425ºF"),
        .init(image: "meal 7", title: "Step 2", description: "Prepare farro with a heavy pinch of kosher salt added to the water"),
        .init(image: "meal 3", title: "Step 3", description: "Toss shrimp and add salt and pepper and a zest from the grapefruit, allow to marinade for about 15 minutes"),
        .init(image: "meal 4", title: "Step 4", description: "Section the grapefruit over a large salad bowl to catch the juices."),
        .init(image: "meal 5", title: "Step 5", description: "peel the fennel and cut into quarts."),
        .init(image: "meal 6", title: "Step 6", description: "Remove pan from oven and add the shrimp, spreading them out so they are in one layer.")
    ]
}


struct MealModel: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let time: String
    let calories: String
    var isFavorite: Bool
    
    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
    
    static let mealMock: [MealModel] = [
        MealModel(image: "meal 1", title: "Homemade Huevos Rancheros", time: "40", calories: "🔥 526 Cal", isFavorite: false),
        MealModel(image: "meal 2", title: "Roasted ", time: "25", calories: "🔥 111 Cal", isFavorite: false),
        MealModel(image: "meal 3", title: "Rancheros", time: "10", calories: "🔥 575 Cal", isFavorite: false),
        MealModel(image: "meal 4", title: "Shrimp Kale Slad", time: "33", calories: "🔥 86 Cal", isFavorite: false),
        MealModel(image: "meal 5", title: "Huevos", time: "22", calories: "🔥 255 Cal", isFavorite: false),
        MealModel(image: "meal 6", title: "Grapefruit", time: "15", calories: "🔥 744 Cal", isFavorite: false),
        MealModel(image: "meal 7", title: "Homemade Huevos Rancheros", time: "8", calories: "🔥 133 Cal", isFavorite: false),
        MealModel(image: "meal 8", title: "Slad with Grapefruit", time: "35", calories: "🔥 225 Cal", isFavorite: false),
    ]
}



struct FitnessActivityData: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let activityFrom: String
    let activityTo: String
    
    static let fitnessActivityMock: [FitnessActivityData] = [
        .init(title: "Steps", image: "shoeprints.fill", activityFrom: "11 000", activityTo: "/  16 000"),
        .init(title: "Calories", image: "flame.fill", activityFrom: "440", activityTo: "/  680 Cal"),
        .init(title: "Water", image: "drop.fill", activityFrom: "1,8", activityTo: "/  2,5 L"),
    ]
}

    
struct CalendarModel: Identifiable {
    let id = UUID()
    let day: String
    let numner: String
    
    static let calendarMock: [CalendarModel] = [
        .init(day: "M", numner: "1"),
        .init(day: "T", numner: "2"),
        .init(day: "W", numner: "3"),
        .init(day: "T", numner: "4"),
        .init(day: "F", numner: "5"),
        .init(day: "S", numner: "6"),
        .init(day: "S", numner: "7"),
//        .init(day: "M", numner: "8"),
//        .init(day: "T", numner: "9"),
//        .init(day: "W", numner: "10"),
//        .init(day: "T", numner: "11"),
//        .init(day: "F", numner: "12"),
//        .init(day: "S", numner: "13"),
//        .init(day: "S", numner: "14"),
//        .init(day: "M", numner: "15"),
//        .init(day: "T", numner: "16"),
//        .init(day: "W", numner: "17"),
//        .init(day: "T", numner: "18"),
//        .init(day: "F", numner: "19"),
//        .init(day: "S", numner: "20"),
//        .init(day: "S", numner: "21"),
//        .init(day: "M", numner: "22"),
//        .init(day: "T", numner: "23"),
//        .init(day: "W", numner: "24"),
//        .init(day: "T", numner: "25"),
//        .init(day: "F", numner: "26"),
//        .init(day: "S", numner: "27"),
//        .init(day: "S", numner: "28"),
//        .init(day: "M", numner: "29"),
//        .init(day: "T", numner: "30"),
//        .init(day: "W", numner: "31"),
    ]
}


struct ChartsData: Identifiable {
    let id = UUID()
    let width: CGFloat = 4
    let height: CGFloat
    
    static let mockData: [ChartsData] = [
        .init(height: 25),
        .init(height: 65),
        .init(height: 60),
        .init(height: 45),
        .init(height: 15),
    ]
}



struct MyPlanData: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
    let color: Color
    
    static let mockData2022: [MyPlanData] = [
        .init(day: "Aug 1", value: 35, color: .raisinBlack),
        .init(day: "Aug 2", value: 77, color: .raisinBlack),
        .init(day: "Aug 3", value: 44, color: .raisinBlack),
        .init(day: "Aug 4", value: 66, color: .raisinBlack),
        .init(day: "Aug 5", value: 54, color: .raisinBlack),
        .init(day: "Aug 6", value: 46, color: .raisinBlack),
        .init(day: "Aug 7", value: 34, color: .raisinBlack)
    ]
    
    static let mockData2023: [MyPlanData] = [
        .init(day: "Aug 1", value: 14, color: .davyGray),
        .init(day: "Aug 2", value: 22, color: .davyGray),
        .init(day: "Aug 3", value: 86, color: .davyGray),
        .init(day: "Aug 4", value: 54, color: .davyGray),
        .init(day: "Aug 5", value: 93, color: .davyGray),
        .init(day: "Aug 6", value: 33, color: .davyGray),
        .init(day: "Aug 7", value: 25, color: .davyGray)
    ]
}
