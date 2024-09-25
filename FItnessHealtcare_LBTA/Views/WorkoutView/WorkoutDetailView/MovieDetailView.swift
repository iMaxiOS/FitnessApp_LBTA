//
//  MovieDetailView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 24.09.2024.
//

import SwiftUI
import Combine
import AVFoundation

struct MovieDetailView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @EnvironmentObject var session: SessionManager
    
    private var workouts: [WorkoutModel] = WorkoutModel.categoryData[.workouts]!
    @State private var isPlaining: Bool = true
    @State private var progress: CGFloat = 0.0
    @State private var videoDuration: Double = 0.0
    @State private var currentPage: Int = 0
    @State private var workout: WorkoutModel?
    
    var videoURL: URL {
        Bundle.main.url(forResource: "movie", withExtension: "mp4")!
    }
    
    
    var body: some View {
        ZStack {
            Color.BG
            
            VStack {
                videoSectionView
                bottomSectionView
            }
        }
        .overlay(alignment: .topLeading) {
            BackNavigationButtonView()
                .padding(.top, safeAreaInsets.top)
                .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
    }
}

private extension MovieDetailView {
    
    var videoSectionView: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<workouts.count, id: \.self) { index in
                Image(workouts[index].image)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
                    .overlay(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(workouts[index].title)
                                .foregroundStyle(.white)
                                .font(Font.Jakarta.bold(size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(30)
                    }
                    .tag(index)
            }
        }
        .background(.red)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
    
    var bottomSectionView: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack(spacing: 10) {
                    Button {
                        withAnimation(.linear) {
                            if currentPage > 0 {
                                withAnimation(.spring()) {
                                    currentPage -= 1
                                }
                            } else {
                                currentPage = 0
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Previous")
                        }
                        .foregroundStyle(.lime)
                        .padding(.vertical, 20)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    .disabled(currentPage == 0)
                    .opacity(currentPage == 0 ? 0.5 : 1)
                    
                    Button {
                        withAnimation(.linear) {
                            if currentPage < workouts.count - 1 {
                                withAnimation(.spring()) {
                                    currentPage += 1
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.raisinBlack)
                        .padding(.vertical, 20)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(.lime)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    .disabled(currentPage == workouts.count - 1)
                    .opacity(currentPage == workouts.count - 1 ? 0.5 : 1)
                }
                
                Button {
                    session.path.removeAll()
                } label: {
                    Text("See all")
                        .foregroundStyle(.lime)
                        .font(Font.Jakarta.semiBold(size: 15))
                        .padding()
                }
            }
            .font(Font.Jakarta.semiBold(size: 17))
            .padding(.bottom, 40)
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .frame(maxWidth: .infinity)
        .background(.raisinBlack)
        .clipShape(.rect(cornerRadius: 50))
    }
    
//    private func calculateVideoDuration() {
//        let asset = AVAsset(url: videoURL)
//        videoDuration = asset.duration.seconds
//    }
//    
//    private func simulateProgress() {
//        let interval = 0.1
//        if progress < 1 {
//            withAnimation(.linear(duration: interval)) {
//                progress += CGFloat(interval / videoDuration)
//            }
//        }
//    }
}

#Preview {
    MovieDetailView()
        .environmentObject(SessionManager())
}
