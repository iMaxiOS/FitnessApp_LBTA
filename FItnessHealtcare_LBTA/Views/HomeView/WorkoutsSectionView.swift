//
//  WorkoutsSectionView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

struct WorkoutsSectionView: View {
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Workouts")
                    .font(Font.Jakarta.medium(size: 17))
                
                Spacer()
                
                Button {
                    session.selectedTab = .workout
                } label: {
                    Text("See all")
                        .font(Font.Jakarta.medium(size: 12))
                        .foregroundStyle(.lime)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 10)
            
            ForEach(HomeWorkoutModel.homeWorkoutMock) { workout in
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
    WorkoutsSectionView()
        .environmentObject(SessionManager())
}
