//
//  Ext+View.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 16.08.2024.
//

import SwiftUI

@MainActor
extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: RouterDestination.self) { destination in
            switch destination {
            case .login:
                LoginView()
            case .tabbar:
                TabbarView()
            case .home:
                HomeView()
            case .workout:
                WorkoutView()
            case .meal:
                MealView()
            case .statistics:
                StatisticsView()
            case .plan:
                MyPlanView()
            case .profile:
                ProfileView()
                    .toolbar(.hidden, for: .navigationBar)
            case .workoutDetail(let workout):
                WorkoutDetailView(workout: workout)
                    .toolbar(.hidden, for: .navigationBar)
            case .mealDetail(let meal):
                MealDetailView(meal: meal)
                    .toolbar(.hidden, for: .navigationBar)
            case .trainerDetail(let workout):
                TrainerDetailView(workout: workout)
                    .toolbar(.hidden, for: .navigationBar)
            case .appointment(let workout):
                BookAppointmentView(workout: workout)
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
