//
//  MealCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 28.08.2024.
//

import SwiftUI

struct MealCellView: View {
    @Binding var meal: MealModel
    
    var body: some View {
        Image(meal.image)
            .resizable()
            .frame(height: 220)
            .overlay(alignment: .topTrailing) {
                Button {
                    meal.toggleFavorite()
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black.opacity(0.6))
                        .overlay {
                            Image(systemName: meal.isFavorite ? "bookmark.fill" : "bookmark")
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
                    Text(meal.title)
                        .lineLimit(2)
                        .font(Font.Jakarta.medium(size: 14))
                    
                    HStack {
                        HStack(spacing: 6) {
                            Image(systemName: "play.fill")
                            Text("\(meal.time) min")
                                .font(Font.Jakarta.regular(size: 12))
                        }
                        
                        Spacer()
                        
                        Text(meal.calories)
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
    MealCellView(meal: .constant(MealModel.mealCategoryData[.breakfast]![2]))
}
