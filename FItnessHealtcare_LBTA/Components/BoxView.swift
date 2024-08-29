//
//  BoxView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 21.08.2024.
//

import SwiftUI

struct BoxView<ViewContent: View>: View {
    
    @ViewBuilder let content: ViewContent
    
    var body: some View {
        content
            .foregroundStyle(.tint)
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            .background(.davyGray)
            .clipShape(.rect(cornerRadius: 50))
    }
}
