//
//  MealHorizontalCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 14.08.2024.
//

import SwiftUI

struct MealHorizontalCellView: View {
    @Binding var mealSelected: MealCategoryType
    @Binding var tool: ToolsType
    var selected: MealCategoryType
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(mealSelected != selected ? Color.davyGray : Color.lime)
            .frame(width: 110, height: 35)
            .overlay {
                Text(selected.rawValue.capitalized)
                    .foregroundStyle(mealSelected != selected ? Color.white : Color.raisinBlack)
                    .font(Font.Jakarta.medium(size: 16))
            }
            .onTapGesture {
                withAnimation(.snappy) {
                    mealSelected = selected
                    tool = .defaulting
                }
            }
    }
}

