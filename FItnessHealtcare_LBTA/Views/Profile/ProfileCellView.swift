//
//  ProfileCellView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 16.08.2024.
//

import SwiftUI

enum ItemPosition: CaseIterable {
    case journal, edit, payment, settings, termsAndCond, feedback, support, signout
    
    var title: String {
        switch self {
        case .journal: "My Journal"
        case .edit: "Edit Profile"
        case .payment: "Payment"
        case .settings: "Settings"
        case .termsAndCond: "Terms and Conditions"
        case .feedback: "Give Us Feedback"
        case .support: "Support"
        case .signout: "Sign Out"
        }
    }
    
    var image: String {
        switch self {
        case .journal: "externaldrive.fill"
        case .edit: "square.and.pencil"
        case .payment: "handbag"
        case .settings: "gearshape"
        case .termsAndCond: "list.clipboard"
        case .feedback: "wand.and.stars"
        case .support: "bubble.left.and.bubble.right"
        case .signout: "rectangle.portrait.and.arrow.forward"
        }
    }
}

struct ProfileCellView: View {
    var item: ItemPosition
    
    var handle: (() -> Void?)? = nil
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: item.image)
                    .foregroundStyle(.lime)
                Text(item.title)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                PushNavigationButtonView {
                    handle?()
                }
            }
            .font(Font.Jakarta.semiBold(size: 17))
            .padding(.top, 1)
            
            if item != .settings && item != .support && item != .signout {
                RoundedRectangle(cornerRadius: 1)
                    .fill(.white.opacity(0.5))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ProfileCellView(item: .journal)
}
