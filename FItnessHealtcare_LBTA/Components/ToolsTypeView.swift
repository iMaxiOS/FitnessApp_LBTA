//
//  ToolsTypeView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 29.08.2024.
//

import SwiftUI

struct WorkoutToolsTypeView: View {
    
    @Binding var isSearchText: Bool
    @StateObject var vm: WorkoutViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            if !isSearchText {
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
            }
            
            HStack(spacing: 4) {
                Image(systemName: "magnifyingglass")
                
                if isSearchText {
                    TextField("", text: $vm.searchText)
                    
                }
                
                ZStack {
                    Text("Search")
                        .opacity(isSearchText ? 0 : 1)
                    Text("Cancel")
                        .opacity(isSearchText ? 1 : 0)
                        .onTapGesture {
                            withAnimation(.spring) {
                                vm.searchText = ""
                                isSearchText = false
                            }
                        }
                }
            }
            .padding(isSearchText ? 16 : 0)
            .background(
                Capsule()
                    .fill(isSearchText ? .davyGray : .clear)
                    .frame(height: 50)
            )
            .onTapGesture {
                withAnimation(.spring) {
                    isSearchText = true
                    vm.tool = .searching
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 40)
        .frame(height: 50)
        .padding(.bottom, 8)
    }
}

struct MealToolsTypeView: View {
    
    @Binding var isSearchText: Bool
    @StateObject var vm: MealViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            if !isSearchText {
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
            }
            
            HStack(spacing: 4) {
                Image(systemName: "magnifyingglass")
                
                if isSearchText {
                    TextField("", text: $vm.searchText)
                    
                }
                
                ZStack {
                    Text("Search")
                        .opacity(isSearchText ? 0 : 1)
                    Text("Cancel")
                        .opacity(isSearchText ? 1 : 0)
                        .onTapGesture {
                            withAnimation(.spring) {
                                vm.searchText = ""
                                isSearchText = false
                            }
                        }
                }
            }
            .padding(isSearchText ? 16 : 0)
            .background(
                Capsule()
                    .fill(isSearchText ? .davyGray : .clear)
                    .frame(height: 50)
            )
            .onTapGesture {
                withAnimation(.spring) {
                    isSearchText = true
                    vm.tool = .searching
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 40)
        .frame(height: 50)
        .padding(.bottom, 8)
    }
}
