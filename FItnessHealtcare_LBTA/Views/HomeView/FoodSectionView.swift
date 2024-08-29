//
//  FoodSectionView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 14.08.2024.
//

import SwiftUI

struct FoodSectionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Food")
                    .font(Font.Jakarta.medium(size: 17))
                
                Text("243")
                    .font(Font.Jakarta.bold(size: 25)) +
                Text("/  1 855 Cal")
                    .font(Font.Jakarta.regular(size: 13))
                    .foregroundStyle(.dimGray)
            }
            
            Spacer()
            
            HStack {
                
                
                Button {} label: {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.lime)
                        .frame(width: 100, height: 45)
                        .overlay {
                            Text("Record")
                                .foregroundStyle(.raisinBlack)
                                .font(Font.Jakarta.semiBold(size: 13))
                        }
                }
                .buttonStyle(.plain)
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
    FoodSectionView()
}
