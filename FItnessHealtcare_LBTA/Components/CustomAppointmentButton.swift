//
//  CustomAppointmentButton.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 21.08.2024.
//

import SwiftUI

struct CustomAppointmentButton: View {
    
    var handle: () -> Void
    
    var body: some View {
        ZStack {
            Button {
                handle()
            } label: {
                Text("Book an Appointment")
                    .foregroundStyle(.raisinBlack)
                    .font(Font.Jakarta.semiBold(size: 17))
                    .padding(.vertical, 20)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.lime)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            .padding(.bottom)
            .buttonStyle(.plain)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.raisinBlack)
        .clipShape(.rect(cornerRadius: 50))
    }
}

#Preview {
    CustomAppointmentButton(handle: {})
}
