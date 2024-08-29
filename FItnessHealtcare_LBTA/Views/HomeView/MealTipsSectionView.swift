//
//  MealTipsSectionView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 14.08.2024.
//

import SwiftUI

struct MealTipsSectionView: View {
    @EnvironmentObject var session: SessionManager
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Meal Tips")
                    .font(Font.Jakarta.medium(size: 17))
                
                Spacer()
                
                Button {
                    session.selectedTab = .meal
                } label: {
                    Text("See all")
                        .font(Font.Jakarta.medium(size: 12))
                        .foregroundStyle(.lime)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 15)
            .padding([.bottom, .top], 10)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(MealModel.mealMock[...1]) { meal in
                    MealCellView(meal: .constant(meal))
                }
            }
        }
        .foregroundStyle(.tint)
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(.davyGray)
        .clipShape(.rect(cornerRadius: 40))

    }
}

#Preview {
    MealTipsSectionView()
        .environmentObject(SessionManager())
}
