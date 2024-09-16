//
//  CongratulationPopupView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct CongratulationPopupView: View {
    let destination: DestinationPopupView
    var error: String? = nil
    
    @Binding var isToggle: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.lime
            
            VStack(spacing: 20) {
                Image(systemName: destination == .error ? "exclamationmark.warninglight.fill" : "checkmark.circle.fill")
                    .resizable()
                    .foregroundStyle(.davyGray)
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(Circle().fill(destination == .error ? .clear : .dimGray).opacity(0.4))
                    .padding(.top)
                
                Text(destination == .error ? "Error!" : "Congratulation")
                    .font(Font.Jakarta.bold(size: 28))
                
                ZStack {
                    Text(destination == .error ? error ?? "unknown" : "Now you have unlitimed access to\nall workouts.\n A confirmation email has been\nsend to  ")
                        .font(Font.Jakarta.medium(size: 11))
                    +
                    Text(destination == .error ? "" : "less...@gmail,com")
                        .font(Font.Jakarta.bold(size: 11))
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                
                Button {
                    withAnimation(.linear) {
                        isToggle = false
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
        .frame(height: destination == .error ? 400 : 500)
        .padding(10)
        .transition(.scale)
    }
}

#Preview {
    CongratulationPopupView(destination: .error, isToggle: .constant(false))
        .environmentObject(SessionManager())
}
