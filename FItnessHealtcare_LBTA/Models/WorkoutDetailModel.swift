//
//  WorkoutDetailModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import Foundation

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
