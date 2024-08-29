//
//  WorkoutTrainersCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct WorkoutTrainersCellView: View {
    let workout: WorkoutModel
    
    var body: some View {
        HStack(spacing: 14) {
            Image(workout.image)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(alignment: .bottom) {
                    Text(workout.balls)
                        .foregroundStyle(.raisinBlack)
                        .font(Font.Jakarta.medium(size: 10))
                        .padding(.vertical, 1)
                        .padding(.horizontal, 4)
                        .background(.lime)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .offset(y: 6)
                }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(workout.name)
                    .font(Font.Jakarta.semiBold(size: 17))
                    .foregroundStyle(.tint)
                Text(workout.subtitle)
                    .foregroundStyle(.dimGray)
                    .font(Font.Jakarta.medium(size: 11))
                Text(workout.description)
                    .foregroundStyle(.lime)
                    .padding(.vertical, 3)
            }
            .font(Font.Jakarta.medium(size: 12))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.lime)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 20)
        .background(.davyGray)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(.lime.opacity(0.4), style: .init(lineWidth: 1))
        }
    }
}

#Preview {
    WorkoutTrainersCellView(workout: WorkoutModel.categoryData[.workouts]![0])
        .preferredColorScheme(.dark)
}
