//
//  PremiumView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct PremiumPopupView: View {
    @EnvironmentObject var session: SessionManager
    
    var workout: WorkoutModel? = nil
    var meal: MealModel? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(workout != nil ? (workout?.image ?? "") : (meal?.image ?? ""))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Upgrade to Premium")
                        .foregroundStyle(.tint)
                        .font(Font.Jakarta.semiBold(size: 17))
                    
                    Text("Subscribe to take a personal fitness plan")
                        .font(Font.Jakarta.regular(size: 11))
                        .foregroundStyle(.lime)
                }
                .padding(.horizontal)
                
                VStack {
                    Button {
                        withAnimation(.bouncy) {
                            session.isPremium.toggle()
                            session.isSuccessful.toggle()
                        }
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("119.99$/year")
                                    .font(Font.Jakarta.semiBold(size: 15))
                                Text("1 month free, then 9.99$/month")
                            }
                            
                            Spacer()
                            
                            HStack {
                                Text("Save 30%")
                                Image(systemName: "chevron.right")
                            }
                        }
                        .font(Font.Jakarta.regular(size: 11))
                        .frame(height: 40)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .foregroundStyle(.raisinBlack)
                        .background(Capsule().fill(.lime))
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        withAnimation(.bouncy) {
                            session.isPremium.toggle()
                            session.isSuccessful.toggle()
                        }
                    } label: {
                        HStack {
                            Text("14.99$/month")
                                .font(Font.Jakarta.semiBold(size: 15))
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.lime)
                        .font(Font.Jakarta.regular(size: 11))
                        .frame(height: 40)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .foregroundStyle(.raisinBlack)
                        .background(Capsule().fill(.raisinBlack))
                    }
                    .buttonStyle(.plain)
                }
                .padding(14)
                .background(Color.davyGray)
                .clipShape(.rect(cornerRadius: 50))
            }
        }
        .padding(10)
        .transition(.scale)

    }
}

#Preview {
    PremiumPopupView(workout: nil, meal: nil)
        .environmentObject(SessionManager())
}
