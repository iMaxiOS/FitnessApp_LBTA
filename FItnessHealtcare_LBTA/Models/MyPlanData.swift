//
//  MyPlanData.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import SwiftUI

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
