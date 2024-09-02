//
//  MealModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import Foundation

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
    
    static var mealCategoryData: [MealCategoryType: [MealModel]] = [
        .breakfast: [
            MealModel(image: "meal 1", title: "Homemade Huevos Rancheros", time: "40", calories: "🔥 526 Cal", isFavorite: false),
            MealModel(image: "meal 2", title: "Roasted ", time: "25", calories: "🔥 111 Cal", isFavorite: false),
            MealModel(image: "meal 3", title: "Rancheros", time: "10", calories: "🔥 575 Cal", isFavorite: false),
            MealModel(image: "meal 4", title: "Shrimp Kale Slad", time: "33", calories: "🔥 86 Cal", isFavorite: false),
            MealModel(image: "meal 5", title: "Huevos", time: "22", calories: "🔥 255 Cal", isFavorite: false),
            MealModel(image: "meal 6", title: "Grapefruit", time: "15", calories: "🔥 744 Cal", isFavorite: false),
        ],
        .brunch: [
            MealModel(image: "meal 2", title: "Roasted ", time: "25", calories: "🔥 111 Cal", isFavorite: false),
            MealModel(image: "meal 3", title: "Rancheros", time: "10", calories: "🔥 575 Cal", isFavorite: false),
            MealModel(image: "meal 4", title: "Shrimp Kale Slad", time: "33", calories: "🔥 86 Cal", isFavorite: false),
            MealModel(image: "meal 5", title: "Huevos", time: "22", calories: "🔥 255 Cal", isFavorite: false),
        ],
        .lunch: [
            MealModel(image: "meal 3", title: "Rancheros", time: "10", calories: "🔥 575 Cal", isFavorite: false),
            MealModel(image: "meal 4", title: "Shrimp Kale Slad", time: "33", calories: "🔥 86 Cal", isFavorite: false),
            MealModel(image: "meal 5", title: "Huevos", time: "22", calories: "🔥 255 Cal", isFavorite: false),
            MealModel(image: "meal 6", title: "Grapefruit", time: "15", calories: "🔥 744 Cal", isFavorite: false),
        ],
        .snake: [
            MealModel(image: "meal 6", title: "Grapefruit", time: "15", calories: "🔥 744 Cal", isFavorite: false),
            MealModel(image: "meal 7", title: "Homemade Huevos Rancheros", time: "8", calories: "🔥 133 Cal", isFavorite: false),
            MealModel(image: "meal 8", title: "Slad with Grapefruit", time: "35", calories: "🔥 225 Cal", isFavorite: false),
        ]
    ]
}
