//
//  TabbarView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        NavigationStack(path: $session.path) {
            ZStack {
                TabView(selection: $session.selectedTab) {
                    HomeView()
                        .tag(TabType.home)
                        .toolbar(.hidden, for: .tabBar)
                        .toolbarColorScheme(nil, for: .tabBar)
                        .toolbarBackground(.hidden, for: .tabBar)
                        .environmentObject(session)
                    MealView()
                        .tag(TabType.meal)
                        .toolbar(.hidden, for: .tabBar)
                        .toolbarColorScheme(nil, for: .tabBar)
                        .toolbarBackground(.hidden, for: .tabBar)
                        .environmentObject(session)
                    WorkoutView()
                        .tag(TabType.workout)
                        .toolbar(.hidden, for: .tabBar)
                        .toolbarColorScheme(nil, for: .tabBar)
                        .toolbarBackground(.hidden, for: .tabBar)
                        .environmentObject(session)
                    StatisticsView()
                        .tag(TabType.statistics)
                        .toolbar(.hidden, for: .tabBar)
                        .toolbarColorScheme(nil, for: .tabBar)
                        .toolbarBackground(.hidden, for: .tabBar)
                        .environmentObject(session)
                    MyPlanView()
                        .tag(TabType.plan)
                        .toolbar(.hidden, for: .tabBar)
                        .toolbarColorScheme(nil, for: .tabBar)
                        .toolbarBackground(.hidden, for: .tabBar)
                        .environmentObject(session)
                }
            }
            .withAppRouter()
            .overlay(alignment: .bottom, content: {
                HStack {
                    ForEach(TabType.allCases, id: \.rawValue) { tab in
                        if tab == .workout {
                            CircleTabButton(selected: $session.selectedTab, index: tab)
                                .offset(y: -6)
                                .zIndex(1)
                        } else {
                            RegularTabButton(selected: $session.selectedTab, index: tab)
                                .zIndex(0)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 81)
                .background(Color.raisinBlack)
                .clipShape(.rect(topLeadingRadius: 50, topTrailingRadius: 50))
            })
            .ignoresSafeArea()
        }
    }
}

// MARK: - RegularTabButton
struct RegularTabButton: View {
    @Binding var selected: TabType
    let index: TabType
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: index.image)
                .frame(height: 20)
            Text(index.title)
                .font(Font.Jakarta.bold(size: 13))
        }
        .frame(width: 60)
        .foregroundStyle(selected == index ? Color(.tintColor) : Color.dimGray)
        .onTapGesture {
            withAnimation(.bouncy) {
                selected = index
                
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}

// MARK: - CircleTabButton
struct CircleTabButton: View {
    @Binding var selected: TabType
    let index: TabType
    
    var body: some View {
        Circle()
            .foregroundStyle(.lime)
            .frame(width: 60, height: 60)
            .overlay {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.raisinBlack)
            }
            .onTapGesture {
                withAnimation(.bouncy) {
                    selected = index
                    
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                }
            }
    }
}

#Preview {
    TabbarView()
        .environmentObject(SessionManager())
}

