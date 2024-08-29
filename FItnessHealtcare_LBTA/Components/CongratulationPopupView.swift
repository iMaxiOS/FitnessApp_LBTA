//
//  CongratulationPopupView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct CongratulationPopupView: View {
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.lime
            
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundStyle(.davyGray)
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(Circle().fill(.dimGray).opacity(0.4))
                    .padding(.top)
                
                Text("Congratulation")
                    .font(Font.Jakarta.bold(size: 24))
                
                ZStack {
                    Text("Now you have unlitimed access to\nall workouts.\n A confirmation email has been\nsend to  ")
                        .font(Font.Jakarta.medium(size: 11))
                    +
                    Text("less...@gmail,com")
                        .font(Font.Jakarta.bold(size: 11))
                }
                .multilineTextAlignment(.center)
                
                
                Button {
                    withAnimation(.linear) {
                        session.isSuccessful.toggle()
                    }
                } label: {
                    Text("Close")
                        .font(Font.Jakarta.bold(size: 16))
                        .foregroundStyle(.lime)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Capsule().fill(.davyGray))
                        .padding(12)
                }
                .buttonStyle(.plain)
            }
            .foregroundStyle(.raisinBlack)
        }
        .clipShape(.rect(cornerRadius: 50))
        .frame(height: 500)
        .padding(10)
        .transition(.scale)
    }
}

#Preview {
    CongratulationPopupView()
        .environmentObject(SessionManager())
}
