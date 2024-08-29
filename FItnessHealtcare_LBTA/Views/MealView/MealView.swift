//
//  MealView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

enum MealTopSection: String, CaseIterable {
    case breakfast, brunch, lunch, snake
}

struct MealView: View {
    @EnvironmentObject var session: SessionManager
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @State private var mealSelected: MealTopSection = .breakfast
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        ZStack {
            Color.BG
            workoutScrollSection
        }
        .overlay(alignment: .top) {
            topContentSection
        }
        .ignoresSafeArea()
    }
}

private extension MealView {
    var topContentSection: some View {
        VStack(spacing: 0) {
            Text("Browse")
                .font(Font.Jakarta.medium(size: 19))
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(MealTopSection.allCases, id: \.rawValue) { item in
                        MealHorizontalCellView(
                            mealSelected: $mealSelected,
                            selected: item
                        )
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 25)
            
            RoundedRectangle(cornerRadius: 0.5)
                .frame(height: 1)
                .foregroundStyle(.tint)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            HStack(spacing: 20) {
                Button { } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "camera.filters")
                        Text("Filters")
                    }
                }
                .buttonStyle(.plain)
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(width: 1, height: 30)
                
                Button { } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Sorting")
                    }
                }
                .buttonStyle(.plain)
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(width: 1, height: 30)
                
                Button { } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 25)
        }
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.5))
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
    
    var workoutScrollSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(choosenMeal()) { item in
                    MealCellView(meal: .constant(item))
                        .onTapGesture {
                            session.path.append(.mealDetail(item))
                        }
                }
            }
            .padding(.bottom, 90)
            .padding(.top, 250)
        }
        .padding(.horizontal, 10)
    }
}

private extension MealView {
    func choosenMeal() -> [MealModel] {
        switch mealSelected {
        case .breakfast:
            return MealModel.mealMock
        case .brunch:
            return MealModel.mealMock.reversed()
        case .lunch:
            return MealModel.mealMock.dropLast().reversed()
        case .snake:
            return MealModel.mealMock.dropLast(5)
        }
    }
}

#Preview {
    MealView()
        .environmentObject(SessionManager())
}
