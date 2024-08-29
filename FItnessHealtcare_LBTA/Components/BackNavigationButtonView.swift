//
//  BackNavigationButtonView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 16.08.2024.
//

import SwiftUI

struct BackNavigationButtonView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            dismiss.callAsFunction()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.lime)
                .frame(width: 40, height: 40)
                .background(.black.opacity(0.7))
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}


struct PushNavigationButtonView: View {
    
    var handle: () -> ()
    
    var body: some View {
        Button {
            handle()
        } label: {
            Image(systemName: "chevron.right")
                .foregroundStyle(.lime)
                .frame(width: 40, height: 40)
                .background(.raisinBlack)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    BackNavigationButtonView()
}
