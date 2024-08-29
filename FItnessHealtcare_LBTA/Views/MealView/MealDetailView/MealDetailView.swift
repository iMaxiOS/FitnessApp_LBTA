//
//  MealDetailView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct MealDetailView: View {
    @EnvironmentObject var session: SessionManager
    @Environment(\.safeAreaInsets) var safeAreaInsets
    
    let meal: MealModel
    
    var body: some View {
        ZStack {
            Color.BG
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    topSectionView
                    aboutSectionView
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
            }
            
            if session.isPremium {
                PremiumPopupView(meal: meal)
            } else {
                if session.isSuccessful {
                    CongratulationPopupView()
                }
            }
        })
        .ignoresSafeArea()
    }
}

private extension MealDetailView {
    var topSectionView: some View {
        Image(meal.image)
            .resizable()
            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .scaledToFill()
            .clipShape(.rect(cornerRadius: 50))
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(meal.title)
                        .font(Font.Jakarta.semiBold(size: 17))
                        .foregroundStyle(.tint)
                    
                    HStack(spacing: 15) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("\(meal.time) min")
                                .font(Font.Jakarta.regular(size: 13))
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(.tint)
                        .clipShape(.rect(cornerRadius: 10))
                        
                        HStack {
                            Text("\(meal.calories)")
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
        VStack(alignment: .leading, spacing: 10) {
            Text("About")
                .font(Font.Jakarta.medium(size: 17))
            
            Text("This hearty winter salad has roasted fennel and shrimp with the bright flavour of grapefruit, plus farro and kale for a nutritional powerhouse!")
                .font(Font.Jakarta.regular(size: 13))
                .foregroundStyle(.tint.opacity(0.7))
            
            RoundedRectangle(cornerRadius: 0.5)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.tint.opacity(0.5))
                .padding(.top, 10)
            
            HStack(alignment: .center, spacing: 18) {
                VStack(spacing: 10) {
                    Text("Cuisine")
                        .foregroundStyle(.dimGray)
                    Text("American")
                        .foregroundStyle(.lime)
                }
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(width: 1, height: 40)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.vertical, 10)
                
                VStack(spacing: 10) {
                    Text("Course")
                        .foregroundStyle(.dimGray)
                    Text("Salads")
                        .foregroundStyle(.lime)
                }
                
                RoundedRectangle(cornerRadius: 0.5)
                    .frame(width: 1)
                    .foregroundStyle(.tint.opacity(0.5))
                    .padding(.vertical, 10)
                
                VStack(spacing: 10) {
                    Text("Servings")
                        .foregroundStyle(.dimGray)
                    Text("5 Servings")
                        .foregroundStyle(.lime)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            RoundedRectangle(cornerRadius: 0.5)
                .frame(height: 1)
                .foregroundStyle(.tint.opacity(0.5))
                .padding(.bottom, 10)
            
            HStack {
                Text("Ingredients")
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
                Text("Nutrition")
                    .font(Font.Jakarta.medium(size: 17))
                
                Spacer()
                
                PushNavigationButtonView {
                    
                }
            }
        }
        .padding(.vertical, 10)
        .padding(20)
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.5))
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 50))
    }
    
    var raitingSectionView: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text("3.9")
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
                        Text("45 Ratings")
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
                    Image(meal.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text("4.2")
                        .foregroundStyle(.raisinBlack)
                        .font(Font.Jakarta.medium(size: 13))
                        .padding(.vertical, 2)
                        .padding(.horizontal, 6)
                        .background(.lime)
                        .clipShape(.rect(cornerRadius: 5))
                        .offset(y: 8)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Laura gates")
                    Text("I had such an amazing session with Chris. He instantly picked up on the level of my fitness and adjusted the workout to suit me whilst alse pushing me to mt limits.")
                        .font(Font.Jakarta.regular(size: 13))
                        .foregroundStyle(.dimGray)
                }
            }
            .padding(15)
            .background(.raisinBlack)
            .clipShape(.rect(cornerRadius: 35))

        }
        .padding(.top, 20)
        .padding([.horizontal, .bottom], 10)
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.5))
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 50))
    }
    
    var exercisesSectionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Instructions")
                .font(Font.Jakarta.medium(size: 17))
            Text("8 STEPS")
                .font(Font.Jakarta.regular(size: 10))
                .foregroundStyle(.tint.opacity(0.7))
            
            ForEach(MealDetailModel.mockDetail) { meal in
                HStack {
                    Image(meal.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 70)
                        .clipShape(.rect(cornerRadius: 15))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(meal.title)
                            .font(Font.Jakarta.medium(size: 13))
                        
                        Text(meal.description)
                            .font(Font.Jakarta.regular(size: 12))
                    }
                }
                .padding(1)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.5))
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 50))
    }
    
    var joinButton: some View {
        ZStack {
            Button {
                withAnimation(.bouncy) {
                    session.isPremium.toggle()
                }
            } label: {
                Text("Start Cooking")
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
    MealDetailView(meal: MealModel.mealMock[2])
        .environmentObject(SessionManager())
}
