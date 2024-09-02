//
//  CalendarModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import Foundation

struct CalendarModel: Identifiable {
    let id = UUID()
    let day: String
    let number: String
    let data: CircleProgress
    
    struct CircleProgress: Identifiable, Hashable {
        let id = UUID()
        let progress: [CGFloat]
        let key: String
        let steps: String
        let calories: String
        let water: String
    }
    
    static let calendarMock: [CalendarModel] = [
        .init(day: "M", number: "1", data: .init(progress: [86, 44, 98], key: "1", steps: "10 022", calories: "345", water: "1,5")),
        .init(day: "T", number: "2", data: .init(progress: [55, 33, 88], key: "1", steps: "8 545", calories: "111", water: "1,4")),
        .init(day: "W", number: "3", data: .init(progress: [45, 11, 22], key: "1", steps: "7 334", calories: "77", water: "1,5")),
        .init(day: "T", number: "4", data: .init(progress: [84, 77, 34], key: "1", steps: "7 433", calories: "455", water: "1,8")),
        .init(day: "F", number: "5", data: .init(progress: [22, 37, 83], key: "1", steps: "10 022", calories: "865", water: "1,9")),
        .init(day: "S", number: "6", data: .init(progress: [66, 28, 52], key: "1", steps: "3 457", calories: "644", water: "1,1")),
        .init(day: "S", number: "7", data: .init(progress: [85, 66, 98], key: "1", steps: "7 774", calories: "244", water: "1,4")),
    ]
}
