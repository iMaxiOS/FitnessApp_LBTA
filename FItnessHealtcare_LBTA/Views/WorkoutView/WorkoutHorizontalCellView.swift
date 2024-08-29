//
//  WorkoutHorizontalCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct WorkoutHorizontalCellView: View {
    @Binding var workoutSelected: CategoryType
    var selected: CategoryType
    @Binding var selectedTool: ToolsType

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(workoutSelected != selected ? Color.davyGray : Color.lime)
            .frame(width: 110, height: 35)
            .overlay {
                Text(selected.rawValue.capitalized)
                    .foregroundStyle(workoutSelected != selected ? Color.white : Color.raisinBlack)
                    .font(Font.Jakarta.medium(size: 16))
            }
            .onTapGesture {
                withAnimation(.snappy) {
                    workoutSelected = selected
                    selectedTool = .defaulting
                }
            }
    }
}

#Preview {
    WorkoutHorizontalCellView(
        workoutSelected: .constant(.workouts),
        selected: .workouts,
        selectedTool: .constant(.defaulting)
    )
}
