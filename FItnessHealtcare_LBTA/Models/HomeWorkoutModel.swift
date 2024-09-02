//
//  HomeWorkoutModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import Foundation

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
