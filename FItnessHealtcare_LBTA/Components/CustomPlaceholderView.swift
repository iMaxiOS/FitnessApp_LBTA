//
//  CustomPlaceholderView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 10.09.2024.
//

import SwiftUI

struct CustomPlaceholderView: View {
    var frameSize: CGFloat
    var iconSize: CGFloat = 45
    var cornerRadius: CGFloat = 20
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [.lime, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: frameSize, height: frameSize)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay {
                Image(systemName: "person")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.white)
                    .frame(width: iconSize, height: iconSize)
            }
    }
}

#Preview {
    CustomPlaceholderView(frameSize: 100)
}
