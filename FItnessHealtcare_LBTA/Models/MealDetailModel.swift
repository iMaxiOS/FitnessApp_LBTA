//
//  MealDetailModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import Foundation

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
