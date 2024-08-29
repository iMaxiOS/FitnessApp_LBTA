//
//  DailyActivityView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

struct DailyActivitySectionView: View {
    @EnvironmentObject var session: SessionManager
    
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
                        Text("11 000")
                            .font(Font.Jakarta.bold(size: 25))
                            .foregroundStyle(.lime) +
                        Text("/  16 000")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.lime)
                    }
                    
                    VStack(alignment: .leading, spacing: -5) {
                        Text("Calories")
                            .foregroundStyle(.dimGray)
                            .font(Font.Jakarta.medium(size: 13))
                        Text("400")
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
                        Text("1,8")
                            .font(Font.Jakarta.bold(size: 25))
                            .foregroundStyle(.lime) +
                        Text("/  2,5 L")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.lime)
                    }
                }
                
                Spacer()
                
                FitnessCircleView(frame: 100)
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
    
    var array = [1, 2, 3]
    
    var frame: CGFloat
    
    var body: some View {
        ZStack {
            ForEach(Array(array.enumerated()), id: \.element) { index, element in
                ZStack {
                    Circle()
                        .stroke(Color.dimGray, lineWidth: 13)
                    
                    Circle()
                        .trim(from: 0.06, to: 0.87)
                        .stroke(
                            AngularGradient(gradient: Gradient(colors: [.clear, .clear, .lime, .lime]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                            style: StrokeStyle(lineWidth: 13, lineCap: .round)
                        )
                }
                .frame(width: frame - CGFloat(index * 30), height: frame - CGFloat(index * 30))
                .rotationEffect(.degrees(-90))
            }
        }
    }
}

#Preview {
    DailyActivitySectionView()
        .environmentObject(SessionManager())
}
