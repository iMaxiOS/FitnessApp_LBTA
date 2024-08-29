//
//  WorkoutViewModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 27.08.2024.
//

import Foundation

enum CategoryType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case workouts, fitness, plans, trainers
    
}

enum ToolsType: String, CaseIterable {
    case filtering, sorting, searching, defaulting
}

final class WorkoutViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var workoutSelected: CategoryType = .workouts
    @Published var tool: ToolsType = .defaulting
    @Published var mockWorkout = WorkoutModel.categoryData
    
    var filteredAndSortedModels: [WorkoutModel] {
        switch workoutSelected {
        case .workouts:
            return defaultTool(category: .workouts)
        case .fitness:
            return defaultTool(category: .fitness)
        case .plans:
            return defaultTool(category: .plans)
        case .trainers:
            return defaultTool(category: .trainers)
        }
    }
    
    func defaultTool(category: CategoryType) -> [WorkoutModel] {
        let workouts: [WorkoutModel]
        
        switch tool {
        case .sorting:
            workouts = mockWorkout[workoutSelected]?.sorted { $0.isFavorite && !$1.isFavorite } ?? []
        case .filtering:
            workouts = mockWorkout[workoutSelected]?.sorted(by: { $0.lvl > $1.lvl }) ?? []
        case .searching:
            workouts = mockWorkout[workoutSelected]?.filter {
                searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
            } ?? []
        case .defaulting:
            workouts = mockWorkout[workoutSelected] ?? []
        }
        
        return workouts
    }
}
