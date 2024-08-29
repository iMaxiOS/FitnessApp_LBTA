//
//  StatisticsFoodSectionVIew.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 14.08.2024.
//

import SwiftUI

struct StatisticsFoodSectionVIew: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Food")
                    .font(Font.Jakarta.medium(size: 17))
                
                Spacer()
                
                Button {} label: {
                    Text("See all")
                        .font(Font.Jakarta.medium(size: 12))
                        .foregroundStyle(.lime)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 10)
            
            ForEach(HomeWorkoutModel.homeWorkoutMock[1...2]) { workout in
                WorkoutsCellView(workout: workout)
            }
        }
        .foregroundStyle(.tint)
        .frame(maxWidth: .infinity)
        .padding(25)
        .background(.davyGray)
        .clipShape(.rect(cornerRadius: 40))
    }
}

#Preview {
    StatisticsFoodSectionVIew()
}
