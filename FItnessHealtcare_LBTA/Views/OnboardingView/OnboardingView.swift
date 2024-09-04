//
//  OnboardingView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var session: SessionManager
    
    @State private var isStart: Bool = false
    @State private var endScale: Double = 4
    @State private var duration: Double = 1
    
    var body: some View {
        ZStack {
            if !isStart {
                onboardingView
            } else {
                if session.userSession != nil {
                    TabbarView()
                        .environmentObject(session)
                } else {
                    LoginView()
                        .environmentObject(session)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: duration)) {
                    isStart.toggle()
                }
            }
        }
    }
}

private extension OnboardingView {
    var onboardingView: some View {
        ZStack {
            Color.lime
                .ignoresSafeArea()
            
            Text("Get Ready")
                .font(Font.Jakarta.bold(size: 33))
                .foregroundStyle(.raisinBlack)
        }
        .transition(.scale(scale: endScale))
    }
}

#Preview {
    OnboardingView()
        .environmentObject(SessionManager())
}
