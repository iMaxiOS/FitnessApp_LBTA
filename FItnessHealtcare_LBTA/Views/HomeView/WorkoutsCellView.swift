//
//  WorkoutsCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 14.08.2024.
//

import SwiftUI

struct WorkoutsCellView: View {
    let workout: HomeWorkoutModel
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 10) {
                Image(systemName: workout.image)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.lime, .black)
                    .font(Font.Jakarta.bold(size: 20))
                    .padding(10)
                    .background(Circle().fill(.raisinBlack))
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(workout.title)
                        .font(Font.Jakarta.regular(size: 13))
                        .foregroundStyle(.dimGray)
                    Text(workout.kilometer)
                        .font(Font.Jakarta.bold(size: 17))
                        .foregroundStyle(.tint)
                    
                }
                
                Spacer()
                
                Button {} label: {
                    Text("Today >")
                        .foregroundStyle(.tint)
                        .font(Font.Jakarta.regular(size: 13))
                        .offset(y: 10)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(10)
        .background(
            Color.raisinBlack
                .opacity(0.6)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        )
    }
}

#Preview {
    WorkoutsCellView(workout: HomeWorkoutModel.homeWorkoutMock[2])
}
