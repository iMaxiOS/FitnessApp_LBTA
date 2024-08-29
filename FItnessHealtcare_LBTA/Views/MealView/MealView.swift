//
//  MealView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var session: SessionManager
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @StateObject private var vm = MealViewModel()
    
    @State private var isSearchText: Bool = false
    
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
                    ForEach(MealCategoryType.allCases, id: \.rawValue) { item in
                        MealHorizontalCellView(
                            mealSelected: $vm.mealSelected,
                            tool: $vm.tool,
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
            
            MealToolsTypeView(isSearchText: $isSearchText, vm: vm)
        }
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.5))
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
    
    var workoutScrollSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(vm.filteredAndSortedModels) { item in
                    MealCellView(meal: Binding(
                        get: { item },
                        set: { updatedModel in
                            if let index = vm.mockData[vm.mealSelected]?.firstIndex(where: { $0.id == item.id }) {
                                vm.mockData[vm.mealSelected]?[index] = updatedModel
                            }
                        }))
                }
            }
            .padding(.bottom, 90)
            .padding(.top, 250)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    MealView()
        .environmentObject(SessionManager())
}
