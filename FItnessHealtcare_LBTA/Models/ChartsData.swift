//
//  ChartsData.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 02.09.2024.
//

import Foundation

struct ChartsData: Identifiable {
    let id = UUID()
    let width: CGFloat = 4
    let height: CGFloat
    
    static let mockData: [ChartsData] = [
        .init(height: 25),
        .init(height: 65),
        .init(height: 60),
        .init(height: 45),
        .init(height: 15),
    ]
}
