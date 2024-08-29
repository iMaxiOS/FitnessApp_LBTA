//
//  MealViewModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 29.08.2024.
//

import Foundation

enum MealCategoryType: String, CaseIterable {
    case breakfast, brunch, lunch, snake
}

final class MealViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var mealSelected: MealCategoryType = .breakfast
    @Published var tool: ToolsType = .defaulting
    @Published var mockData = MealModel.mealCategoryData
    
    var filteredAndSortedModels: [MealModel] {
        switch mealSelected {
        case .breakfast:
            return defaultTool(category: .breakfast)
        case .brunch:
            return defaultTool(category: .brunch)
        case .lunch:
            return defaultTool(category: .lunch)
        case .snake:
            return defaultTool(category: .snake)
        }
    }
    
    func defaultTool(category: MealCategoryType) -> [MealModel] {
        let meal: [MealModel]
        
        switch tool {
        case .sorting:
            meal = mockData[mealSelected]?.sorted { $0.isFavorite && !$1.isFavorite } ?? []
        case .filtering:
            meal = mockData[mealSelected]?.sorted(by: { $0.calories > $1.calories }) ?? []
        case .searching:
            meal = mockData[mealSelected]?.filter {
                searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)
            } ?? []
        case .defaulting:
            meal = mockData[mealSelected] ?? []
        }
        
        return meal
    }
}
