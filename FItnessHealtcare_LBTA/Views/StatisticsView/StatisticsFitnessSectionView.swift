//
//  StatisticsFitnessSectionView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 15.08.2024.
//

import SwiftUI

struct StatisticsFitnessSectionView: View {
    @EnvironmentObject var session: SessionManager
    
    var data: CalendarModel
    
    var body: some View {
        VStack(spacing: 25) {
            FitnessCircleView(frame: 120, data: data)
            activitySection
            chartSection
        }
        .foregroundStyle(.tint)
        .frame(maxWidth: .infinity)
        .padding(25)
        .background(.davyGray)
        .clipShape(.rect(cornerRadius: 40))
    }
}

private extension StatisticsFitnessSectionView {
    var activitySection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 30) {
                FitnessCellView(title: "Steps", image: "shoeprints.fill", activityFrom: data.data.steps, activityTo: "/   16 000")
                FitnessCellView(title: "Calories", image: "flame.fill", activityFrom: data.data.calories, activityTo: "/  680 Cal")
                FitnessCellView(title: "Water", image: "drop.fill", activityFrom: data.data.water, activityTo: "/  2,5")
            }
            
            VStack(spacing: 5) {
                HStack(spacing: 10) {
                    Text("Distance while active")
                    Spacer()
                    Text("2.44km")
                        .font(Font.Jakarta.bold(size: 13))
                }
                HStack {
                    Text("Total burnt calories")
                    Spacer()
                    Text("440 Cal")
                        .font(Font.Jakarta.bold(size: 13))
                }
            }
            .font(Font.Jakarta.regular(size: 13))
        }
    }
    
    var chartSection: some View {
        GeometryReader { geometry in
            VStack(spacing: 2) {
                HStack(spacing: 2.7) {
                    ForEach(0..<44) { item in
                        Circle()
                            .frame(width: item == 30 ? 8 : 4, height: item == 30 ? 8 : 4)
                            .foregroundStyle(item == 30 ? Color(.tintColor) : .dimGray)
                    }
                }
                
                HStack {
                    ForEach(["0", "6", "12", "Now", "24(h)"], id: \.self) { item in
                        Text(item)
                            .foregroundStyle(item != "Now" ? .dimGray : Color(.tintColor))
                            .font(Font.Jakarta.regular(size: 13))
                        
                        if item != "24(h)" {
                            Spacer()
                        }
                    }
                }
            }
            .padding(.top, 50)
            .overlay {
                HStack(alignment: .bottom, spacing: 2.7) {
                    ForEach(ChartsData.mockData) { item in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.lime)
                            .frame(width: item.width, height: item.height)
                    }
                }
                .offset(x: 28, y: -15)
            }
        }
        .frame(height: 80)
    }
}


struct FitnessCellView: View {
    let title: String
    let image: String
    let activityFrom: String
    let activityTo: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(Font.Jakarta.regular(size: 13))
                .foregroundStyle(.dimGray)
            
            HStack(spacing: 5) {
                Image(systemName: image)
                    .foregroundStyle(.tint)
                
                VStack(alignment: .leading) {
                    Text(activityFrom)
                        .font(Font.Jakarta.bold(size: 17))
                    Text(activityTo)
                        .font(Font.Jakarta.regular(size: 12))
                }
            }
        }
        .foregroundStyle(.lime)
    }
}

#Preview {
    StatisticsView()
        .environmentObject(SessionManager())
}
