//
//  TabType.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import Foundation

enum TabType: String, CaseIterable {
    case home, meal, workout, statistics, plan
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .meal: return "Meal"
        case .workout: return ""
        case .statistics: return "Statistics"
        case .plan: return "My Plan"
        }
    }
    
    var image: String {
        switch self {
        case .home: return "house"
        case .meal: return "fork.knife"
        case .workout: return ""
        case .statistics: return "chart.bar.xaxis"
        case .plan: return "trophy.fill"
        }
    }
}
