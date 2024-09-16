//
//  WorkoutDetailView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 19.08.2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    @EnvironmentObject var session: SessionManager
    @Environment(\.safeAreaInsets) var safeAreaInsets
    
    let workout: WorkoutModel
    
    var body: some View {
        ZStack {
            Color.BG
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    topSectionView
                    aboutSectionView
                    trainerSectionView
                    raitingSectionView
                    exercisesSectionView
                }
                .padding(.bottom, 100)
            }
        }
        .overlay(alignment: .topLeading) {
            BackNavigationButtonView()
                .padding(.top, safeAreaInsets.top)
                .padding(.horizontal, 20)
        }
        .overlay(alignment: .bottom) {
            joinButton
        }
        .overlay(content: {
            if session.isPremium || session.isSuccessful {
                Color.BG.opacity(0.7)
                    .background(.ultraThinMaterial)
                    .onTapGesture {
                        withAnimation(.linear) {
                            session.isPremium = false
                            session.isSuccessful = false
                        }
                    }
            }
            
            if session.isPremium {
                PremiumPopupView(workout: workout)
            } else {
                if session.isSuccessful {
                    CongratulationPopupView(
                        destination: .congratulation,
                        isToggle: $session.isSuccessful
                    )
                }
            }
        })
        .ignoresSafeArea()
    }
}

private extension WorkoutDetailView {
    var topSectionView: some View {
        Image(workout.image)
            .resizable()
            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .scaledToFill()
            .clipShape(.rect(cornerRadius: 50))
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(workout.title)
                        .font(Font.Jakarta.semiBold(size: 17))
                        .foregroundStyle(.tint)
                    
                    HStack(spacing: 15) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("\(workout.time) min")
                                .font(Font.Jakarta.regular(size: 13))
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(.tint)
                        .clipShape(.rect(cornerRadius: 10))
                        
                        HStack {
                            Text("\(workout.lvl) Cal")
                                .font(Font.Jakarta.regular(size: 13))
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(.tint)
                        .clipShape(.rect(cornerRadius: 10))
                    }
                    .foregroundStyle(.raisinBlack)
                }
                .padding(20)
            }
    }
    
    var aboutSectionView: some View {
        BoxView {
            VStack(alignment: .leading, spacing: 10) {
                Text("About")
                    .font(Font.Jakarta.medium(size: 17))
                
                Text("Buitld chast muscles doesn`t have to be complicated, thse 8 bodyweight exercises that will give you excellent results at home. No equipment.")
                    .font(Font.Jakarta.regular(size: 13))
                    .foregroundStyle(.tint.opacity(0.7))
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.top, 10)
                
                HStack(alignment: .center, spacing: 18) {
                    VStack(spacing: 10) {
                        Text("Level")
                            .foregroundStyle(.dimGray)
                        Text(workout.lvl)
                            .foregroundStyle(.lime)
                    }
                    
                    RoundedRectangle(cornerRadius: 0.5)
                        .frame(width: 1, height: 40)
                        .foregroundStyle(.tint.opacity(0.5))
                        .padding(.vertical, 10)
                    
                    VStack(spacing: 10) {
                        Text("Progress")
                            .foregroundStyle(.dimGray)
                        Text("10 %")
                            .foregroundStyle(.lime)
                    }
                    
                    RoundedRectangle(cornerRadius: 0.5)
                        .frame(width: 1)
                        .foregroundStyle(.tint.opacity(0.5))
                        .padding(.vertical, 10)
                    
                    VStack(spacing: 10) {
                        Text("Focus Area")
                            .foregroundStyle(.dimGray)
                        Text("Chest")
                            .foregroundStyle(.lime)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(height: 1)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.bottom, 10)
                
                HStack {
                    Text("Sound & Music")
                        .font(Font.Jakarta.medium(size: 17))
                    Spacer()
                    PushNavigationButtonView {
                        
                    }
                }
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(height: 1)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.bottom, 10)
                
                HStack {
                    Text("Guide")
                        .font(Font.Jakarta.medium(size: 17))
                    
                    Spacer()
                    
                    PushNavigationButtonView {
                        
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 5)
        }
    }
    
    var trainerSectionView: some View {
        BoxView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Trainer")
                    .padding(.horizontal, 5)
                
                HStack(spacing: 10) {
                    Image(workout.image)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay(alignment: .bottom) {
                            Text("4.6")
                                .foregroundStyle(.raisinBlack)
                                .font(Font.Jakarta.medium(size: 10))
                                .padding(.vertical, 2)
                                .padding(.horizontal, 4)
                                .background(.lime)
                                .clipShape(.rect(cornerRadius: 5))
                                .offset(y: 8)
                        }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Chris Heria")
                        Text("High Intensity Fitness Trainer")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.dimGray)
                        
                        Text("7 years experience")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.lime)
                            .padding(.top)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundStyle(.lime)
                        .font(Font.Jakarta.regular(size: 20))
                }
                .padding(20)
                .background(.raisinBlack)
                .clipShape(.rect(cornerRadius: 40))
            }
            .onTapGesture {
                session.path.append(.trainerDetail(workout))
            }
        }
        .font(Font.Jakarta.medium(size: 17))
        .foregroundStyle(.tint)
    }
    
    var raitingSectionView: some View {
        BoxView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("4.6")
                        .font(Font.Jakarta.medium(size: 40))
                    
                    Spacer()
                    
                    VStack(spacing: 0) {
                        ForEach(["5", "4", "3", "2", "1", ], id: \.self) { item in
                            HStack(spacing: 6) {
                                Text(item)
                                    .font(Font.Jakarta.medium(size: 9))
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 1.5)
                                        .fill(.dimGray)
                                        .frame(height: 3)
                                        .frame(maxWidth: .infinity)
                                    
                                    RoundedRectangle(cornerRadius: 1.5)
                                        .fill(.tint)
                                        .frame(height: 3)
                                        .frame(width: 100)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                        
                        HStack {
                            Text("174 Ratings")
                                .foregroundStyle(.dimGray)
                            Spacer()
                            Button {
                                //                            session.selectedTab = .statistics
                            } label: {
                                Text("See all")
                                    .foregroundStyle(.lime)
                            }
                            .buttonStyle(.plain)
                        }
                        .font(Font.Jakarta.medium(size: 12))
                    }
                    .frame(width: 200)
                }
                .padding(.horizontal, 20)
                
                HStack(alignment: .top, spacing: 10) {
                    VStack(spacing: 6) {
                        Image(workout.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text("4.6")
                            .foregroundStyle(.raisinBlack)
                            .font(Font.Jakarta.medium(size: 13))
                            .padding(.vertical, 2)
                            .padding(.horizontal, 6)
                            .background(.lime)
                            .clipShape(.rect(cornerRadius: 5))
                            .offset(y: 8)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Chris Heria")
                        Text("I had such an amazing session with Chris. He instantly picked up on the level of my fitness and adjusted the workout to suit me whilst alse pushing me to mt limits.")
                            .font(Font.Jakarta.regular(size: 13))
                            .foregroundStyle(.dimGray)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(15)
                .background(.raisinBlack)
                .clipShape(.rect(cornerRadius: 35))
                
            }
        }
    }
    
    var exercisesSectionView: some View {
        BoxView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Exercises")
                    .font(Font.Jakarta.medium(size: 17))
                Text("8 STEPS • 3 SETS")
                    .font(Font.Jakarta.regular(size: 10))
                    .foregroundStyle(.tint.opacity(0.7))
                
                ForEach(WorkoutDetailModel.mockDetail) { workout in
                    HStack {
                        Image(workout.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90, height: 70)
                            .clipShape(.rect(cornerRadius: 15))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(workout.title)
                                .font(Font.Jakarta.medium(size: 13))
                            
                            Text(workout.description)
                                .font(Font.Jakarta.regular(size: 12))
                        }
                    }
                    .padding(1)
                }
            }
            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.tint)
        }
    }
    
    var joinButton: some View {
        ZStack {
            Button {
                withAnimation(.bouncy) {
                    session.isPremium.toggle()
                }
            } label: {
                Text("Join")
                    .foregroundStyle(.raisinBlack)
                    .font(Font.Jakarta.semiBold(size: 17))
                    .padding(.vertical, 20)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.lime)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            .padding(.bottom)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.raisinBlack)
        .clipShape(.rect(cornerRadius: 50))
    }
}

#Preview {
    WorkoutDetailView(workout: WorkoutModel.categoryData[.workouts]![0])
        .environmentObject(SessionManager())
}
