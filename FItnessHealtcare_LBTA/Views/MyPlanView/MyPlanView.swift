//
//  RewardsView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI
import Charts

struct MyPlanView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ZStack {
            Color.BG
            myPlanSection
        }
        .overlay(alignment: .top) {
            topContentSection
        }
        .ignoresSafeArea()
    }
}

private extension MyPlanView {
    var topContentSection: some View {
        ZStack {
            Text("My Plan")
                .font(Font.Jakarta.medium(size: 19))
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .foregroundStyle(.tint)
        .background(.raisinBlack.opacity(0.8))
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
    
    var myPlanSection: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25) {
                HStack {
                    Text("DAY 34/")
                    +
                    Text("100")
                        .foregroundStyle(.dimGray.opacity(0.8))
                    Spacer()
                    Text("24/05, WED")
                }
                .foregroundStyle(.davyGray)
                .font(Font.Jakarta.bold(size: 22))
                
                VStack(spacing: 5) {
                    HStack {
                        Text("5 670") + Text("  steps")
                            .font(Font.Jakarta.regular(size: 13))
                        Spacer()
                        Image(systemName: "stairs")
                    }
                    .font(Font.Jakarta.semiBold(size: 25))
                    .padding(20)
                    .background(.raisinBlack)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    HStack {
                        Text("340.6") + Text("  calories")
                            .font(Font.Jakarta.regular(size: 13))
                        Spacer()
                        Image(systemName: "bolt")
                    }
                    .font(Font.Jakarta.semiBold(size: 25))
                    .padding(20)
                    .background(.raisinBlack)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("WEIGHT")
                            Spacer()
                            Image(systemName: "scalemass")
                        }
                        .font(Font.Jakarta.semiBold(size: 20))
                        
                        HStack {
                            VStack(alignment: .leading, spacing: -2) {
                                Text("Currect")
                                    .font(Font.Jakarta.regular(size: 13))
                                Text("87 kg")
                            }
                            Spacer()
                            Text("----->")
                            Spacer()
                            VStack(alignment: .leading, spacing: -2) {
                                Text("Target")
                                    .font(Font.Jakarta.regular(size: 13))
                                Text("64 kg")
                            }
                        }
                        .font(Font.Jakarta.semiBold(size: 25))
                        .frame(maxWidth: .infinity)
                    }
                    .padding(20)
                    .background(.raisinBlack)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                
                VStack(alignment: .leading) {
                    Text("MY ACTIVITY")
                    
                    HStack(spacing: 0) {
                        VStack {
                            ForEach(["0", "25", "50", "75", "100"].reversed(), id: \.self) { item in
                                Text(item)
                                
                                if item != "0" {
                                    Spacer()
                                }
                            }
                        }
                        VStack {
                            Chart {
                                ForEach(MyPlanData.mockData2022) { item in
                                    BarMark(
                                        x: .value(Text("Day"), item.day),
                                        y: .value(Text("Value"), item.value)
                                    )
                                    .foregroundStyle(item.color)
                                }
                                
                                ForEach(MyPlanData.mockData2023) { item in
                                    BarMark(
                                        x: .value(Text("Day"), item.day),
                                        y: .value(Text("Value"), item.value)
                                    )
                                    .foregroundStyle(item.color)
                                    .cornerRadius(10)
                                }
                            }
                            .frame(height: 300)
                            .chartYAxis(.hidden)
                            .chartXAxis(.hidden)
                        }
                    }
                }
                .foregroundStyle(.davyGray)
                .font(Font.Jakarta.bold(size: 22))
            }
            .foregroundStyle(.lime)
            .padding(25)
            .background(.lime)
            .clipShape(.rect(cornerRadius: 40))
            .padding(.top, 110)
            .padding(.bottom, 85)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    MyPlanView()
}
