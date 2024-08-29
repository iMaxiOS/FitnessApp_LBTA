//
//  HomeView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var session: SessionManager
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ZStack {
            Color.BG
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    StepsSectionView()
                    DailyActivitySectionView()
                    WorkoutsSectionView()
                    FoodSectionView()
                    MealTipsSectionView()
                }
                .padding(.top, 155)
                .padding(.bottom, 85)
            }
            .padding(.horizontal, 10)
        }
        .overlay(alignment: .top) {
            topContentSection
        }
        .ignoresSafeArea()
    }
}

private extension HomeView {
    var topContentSection: some View {
        HStack(spacing: 10) {
            ZStack {
                Image("pic 2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        session.path.append(.profile)
                    }
            }
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(.lime)
                    .frame(width: 13, height: 13)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hello Maxim!")
                    .font(Font.Jakarta.semiBold(size: 16))
                Text("Let`s start your day")
                    .font(Font.Jakarta.regular(size: 12))
            }
            
            Spacer()
            
            Image(systemName: "trophy.fill")
                .renderingMode(.template)
                .foregroundStyle(.lime)
                .frame(width: 35, height: 35)
                .background(Color.davyGray)
                .clipShape(Circle())
        }
        .padding(.top, 80)
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
        .foregroundStyle(.tint)
        .background(.raisinBlack.opacity(0.8))
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
}

#Preview {
    HomeView()
        .environmentObject(SessionManager())
}
