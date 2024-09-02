//
//  StatisticsView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var session: SessionManager
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @State private var calendarSelected: CalendarModel = CalendarModel.calendarMock[4]
    
    var body: some View {
        ZStack {
            Color.BG
        
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    StatisticsFitnessSectionView(data: calendarSelected)
                    WorkoutsSectionView()
                    StatisticsFoodSectionVIew()
                }
                .padding(.top, 250)
                .padding(.bottom, 90)
            }
            .padding(.horizontal, 10)

        }
        .overlay(alignment: .top) {
            topContentSection
        }
        .ignoresSafeArea()
    }
}

private extension StatisticsView {
    var topContentSection: some View {
        VStack(spacing: 0) {
            Text("Activity Calendar")
                .font(Font.Jakarta.medium(size: 19))
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, 40)
            
            HStack(spacing: 10) {
                ForEach(CalendarModel.calendarMock) { item in
                    StatisticsCalendarCellView(
                        calendarSelected: $calendarSelected,
                        selected: item
                    )
                }
            }
            .padding(.bottom, 15)
            .padding(.top, 3)
            
            HStack(spacing: 15) {
                Button {} label: {
                    Image(systemName: "chevron.left")
                }
                Text("October 2022")
                Button {} label: {
                    Image(systemName: "chevron.right")
                }
            }
            .buttonStyle(.plain)
            .font(.subheadline)
            .foregroundStyle(.tint)
            .padding(.bottom, 25)
            
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.8))
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
}

#Preview {
    StatisticsView()
        .environmentObject(SessionManager())
}
