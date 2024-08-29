//
//  ContentView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var session: SessionManager
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @StateObject private var vm = WorkoutViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    private let grids = [
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

private extension WorkoutView {
    var topContentSection: some View {
        VStack(spacing: 0) {
            Text("Browse")
                .font(Font.Jakarta.medium(size: 19))
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(CategoryType.allCases) { item in
                        WorkoutHorizontalCellView(
                            workoutSelected: $vm.workoutSelected,
                            selected: item,
                            selectedTool: $vm.tool
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
                Button { 
                    withAnimation(.spring) {
                        vm.tool = .filtering
                    }
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "camera.filters")
                        Text("Filters")
                    }
                }
                .buttonStyle(.plain)
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(width: 1, height: 30)
                
                Button { 
                    withAnimation(.spring) {
                        vm.tool = .sorting
                    }
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Sorting")
                    }
                }
                .buttonStyle(.plain)
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(width: 1, height: 30)
                
                Button { 
                    withAnimation(.spring) {
                        vm.tool = .searching
                    }
                } label: {
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
            LazyVGrid(columns: vm.workoutSelected != .trainers ? columns : grids, alignment: .center, spacing: 10) {
//                if let models = vm.mockWorkout[vm.workoutSelected] {
                    ForEach(vm.filteredAndSortedModels) { item in
                        if vm.workoutSelected != .trainers {
                            WorkoutCellView(
                                workout: Binding(
                                    get: { item },
                                    set: { updatedModel in
                                        if let index = vm.mockWorkout[vm.workoutSelected]?.firstIndex(where: { $0.id == item.id }) {
                                            vm.mockWorkout[vm.workoutSelected]?[index] = updatedModel
                                        }
                                    })
                            )
                                .onTapGesture {
                                    session.path.append(.workoutDetail(item))
                                }
                        } else {
                            WorkoutTrainersCellView(workout: item)
                                .onTapGesture {
                                    session.path.append(.trainerDetail(item))
                                }
                        }
                    }
//                }
            }
            .padding(.bottom, 90)
            .padding(.top, 250)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    WorkoutView()
        .environmentObject(SessionManager())
}
