//
//  WorkoutCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct WorkoutCellView: View {
    @Binding var workout: WorkoutModel
    
    var body: some View {
        Image(workout.image)
            .resizable()
            .frame(height: 220)
            .overlay(alignment: .topTrailing) {
                Button {
                    workout.toggleFavorite()
                    print(workout)
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black.opacity(0.6))
                        .overlay {
                            Image(systemName: workout.isFavorite ? "bookmark.fill" : "bookmark")
                                .renderingMode(.template)
                                .foregroundStyle(.lime)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 36, height: 36)
                        .padding([.top, .trailing], 20)
                }
                .buttonStyle(.plain)
            }
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 15) {
                    Text(workout.title)
                        .lineLimit(2)
                        .font(Font.Jakarta.medium(size: 14))
                    
                    HStack {
                        HStack(spacing: 6) {
                            Image(systemName: "play.fill")
                            Text("\(workout.time) min")
                                .font(Font.Jakarta.regular(size: 12))
                        }
                        
                        Spacer()
                        
                        Text(workout.lvl)
                            .font(Font.Jakarta.regular(size: 12))
                    }
                    .font(.subheadline)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 20)
                .padding(.top, 10)
                .background(.black.opacity(0.6))
                .foregroundStyle(.tint)
            }
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    WorkoutCellView(
        workout: .constant(WorkoutModel.categoryData[.workouts]![2])
    )
}
