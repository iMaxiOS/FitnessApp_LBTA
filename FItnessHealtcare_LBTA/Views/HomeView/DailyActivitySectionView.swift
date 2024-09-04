//
//  DailyActivityView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

struct DailyActivitySectionView: View {
    @EnvironmentObject var session: SessionManager
    
    var data: CalendarModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Daily Activity")
                    .font(Font.Jakarta.medium(size: 17))
                
                Spacer()
                
                Button {
                    session.selectedTab = .statistics
                } label: {
                    Text("See all")
                        .font(Font.Jakarta.medium(size: 12))
                        .foregroundStyle(.lime)
                }
                .buttonStyle(.plain)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    VStack(alignment: .leading, spacing: -5) {
                        Text("Steps")
                            .foregroundStyle(.dimGray)
                            .font(Font.Jakarta.medium(size: 13))
                        Text(data.data.steps)
                            .font(Font.Jakarta.bold(size: 25))
                            .foregroundStyle(.lime)
                            .contentTransition(.numericText(value: Double(data.data.steps) ?? 0))
                        
                        Text("/  16 000")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.lime)
                    }
                    
                    VStack(alignment: .leading, spacing: -5) {
                        Text("Calories")
                            .foregroundStyle(.dimGray)
                            .font(Font.Jakarta.medium(size: 13))
                        Text(data.data.calories)
                            .font(Font.Jakarta.bold(size: 25))
                            .foregroundStyle(.lime) +
                        Text("/  680 Cal")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.lime)
                    }
                    
                    VStack(alignment: .leading, spacing: -5) {
                        Text("Water")
                            .foregroundStyle(.dimGray)
                            .font(Font.Jakarta.medium(size: 13))
                        Text(data.data.water)
                            .font(Font.Jakarta.bold(size: 25))
                            .foregroundStyle(.lime) +
                        Text("/  2,5 L")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.lime)
                    }
                }
                
                Spacer()
                
                FitnessCircleView(frame: 100, data: data)
            }
        }
        .foregroundStyle(.tint)
        .frame(maxWidth: .infinity)
        .padding(25)
        .background(.davyGray)
        .clipShape(.rect(cornerRadius: 40))
    }
}

struct FitnessCircleView: View {
    @State private var animation: Bool = false
    
    var frame: CGFloat
    var data: CalendarModel
    
    var body: some View {
        ZStack {
            ForEach(data.data.progress[..<3].indices, id: \.self) { index in
                ZStack {
                    Circle()
                        .stroke(Color.dimGray, lineWidth: 13)
                    Circle()
                        .trim(from: 0, to: animation ? data.data.progress[index] / 100 : 0)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(
                                    colors: [.lime, .yellow, .red, .lime]
                                ),
                                center: .center,
                                endAngle: .degrees(360)
                            ), style: StrokeStyle(lineWidth: 14, lineCap: .round, lineJoin: .round))
                }
                .padding(CGFloat(index) * 16)
            }
            .frame(width: frame, height: frame)
            .rotationEffect(.degrees(-90))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    animation = true
                }
            }
        }
    }
}

#Preview {
    DailyActivitySectionView(data: CalendarModel.calendarMock[0])
        .environmentObject(SessionManager())
}
