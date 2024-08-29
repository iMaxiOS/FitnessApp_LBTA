//
//  StepsView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

struct StepsSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Steps")
            
            HStack {
                Text("11 000")
                    .font(Font.Jakarta.bold(size: 25)) +
                Text("/  16 000")
                    .font(Font.Jakarta.regular(size: 13))
                    .foregroundStyle(.dimGray)
                
                Spacer()
                
                VStack(spacing: 3) {
                    Text("68%")
                        .font(Font.Jakarta.medium(size: 10))
                        .offset(x: 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.dimGray)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.lime)
                            .frame(width: 90)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(alignment: .trailing) {
                                Rectangle()
                                    .fill(.raisinBlack)
                                    .frame(width: 1, height: 4)
                                    .offset(x: -36)
                            }
                    }
                    .frame(width: 120, height: 12)
                }
            }
        }
        .foregroundStyle(.tint)
        .frame(maxWidth: .infinity)
        .padding(25)
        .background(.davyGray)
        .clipShape(.rect(cornerRadius: 40))

    }
}

#Preview {
    StepsSectionView()
}
