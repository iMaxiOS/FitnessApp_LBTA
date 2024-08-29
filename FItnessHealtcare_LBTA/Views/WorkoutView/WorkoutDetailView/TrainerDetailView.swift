//
//  TrainerDetailView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct TrainerDetailView: View {
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
                    raitingSectionView
                }
                .padding(.bottom, 105)
            }
        }
        .overlay(alignment: .topLeading) {
            BackNavigationButtonView()
                .padding(.top, safeAreaInsets.top)
                .padding(.horizontal, 20)
        }
        .overlay(alignment: .bottom) {
            CustomAppointmentButton {
                session.path.append(.appointment(workout))
            }
        }
        .ignoresSafeArea()
    }
}

private extension TrainerDetailView {
    var topSectionView: some View {
        Image(workout.image)
            .resizable()
            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .scaledToFill()
            .clipShape(.rect(cornerRadius: 50))
            .overlay(alignment: .bottomLeading) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(workout.name)
                            .font(Font.Jakarta.semiBold(size: 17))
                            .foregroundStyle(.tint)
                        Text(workout.subtitle)
                            .font(Font.Jakarta.regular(size: 12))
                            .foregroundStyle(.lime)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "bubble.left.and.bubble.right")
                        .renderingMode(.template)
                        .foregroundStyle(.raisinBlack)
                        .frame(width: 40, height: 40)
                        .background(.lime)
                        .clipShape(Circle())
                }
                .padding(25)
            }
    }
    
    var aboutSectionView: some View {
        BoxView {
            VStack(alignment: .leading, spacing: 10) {
                Text("About")
                    .font(Font.Jakarta.medium(size: 17))
                
                Text("Famous American callisthenics and pro bar athlete trainer Chris Heria has 4.5 million YouTube subscribers, where he shares his knowledge and workout routines.")
                    .font(Font.Jakarta.regular(size: 13))
                    .foregroundStyle(.tint.opacity(0.7))
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.top, 10)
                
                HStack(alignment: .center, spacing: 18) {
                    VStack(spacing: 10) {
                        Text("Experiance")
                            .foregroundStyle(.dimGray)
                        Text("7 years")
                            .foregroundStyle(.lime)
                    }
                    
                    RoundedRectangle(cornerRadius: 0.5)
                        .frame(width: 1, height: 40)
                        .foregroundStyle(.tint.opacity(0.5))
                        .padding(.vertical, 10)
                    
                    VStack(spacing: 10) {
                        Text("Completed")
                            .foregroundStyle(.dimGray)
                        Text("88")
                            .foregroundStyle(.lime)
                    }
                    
                    RoundedRectangle(cornerRadius: 0.5)
                        .frame(width: 1)
                        .foregroundStyle(.tint.opacity(0.5))
                        .padding(.vertical, 10)
                    
                    VStack(spacing: 10) {
                        Text("Active Clients")
                            .foregroundStyle(.dimGray)
                        Text("32")
                            .foregroundStyle(.lime)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(height: 1)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.bottom, 10)
                
                HStack {
                    Text("Online Programs")
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
                    Text("Social Media")
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
                            Button {} label: {
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
                        Image("pic 5")
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
}

#Preview {
    TrainerDetailView(workout: WorkoutModel.categoryData[.workouts]![0])
        .environmentObject(SessionManager())
}
