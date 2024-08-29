//
//  SessionManager.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import Foundation
import SwiftUI

enum RouterDestination: Hashable {
    case login
    case tabbar
    case home
    case meal
    case workout
    case statistics
    case plan
    case profile 
    case workoutDetail(WorkoutModel)
    case mealDetail(MealModel)
    case trainerDetail(WorkoutModel)
    case appointment(WorkoutModel)
}

@MainActor
final class SessionManager: ObservableObject {
    @Published var path: [RouterDestination] = []
    @Published var transition: Bool = false
    @Published var startSearchPeople: Bool = false
    @Published var selectedTab: TabType = .workout
    @Published var isPremium: Bool = false
    @Published var isSuccessful: Bool = false
    @Published var isShowWorkoutView: Bool = false
    
    public init() {}
    
    public func navigate(to: RouterDestination) {
      path.append(to)
    }
    
    public func logoutSession() {
        path.removeAll()
        isShowWorkoutView.toggle()
        selectedTab = .workout
    }
}
