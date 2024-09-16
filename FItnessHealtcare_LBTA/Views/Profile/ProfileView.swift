//
//  ProfileView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 16.08.2024.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @EnvironmentObject var session: SessionManager
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    private let firstSection: [ItemPosition] = [.journal, .edit, .payment, .settings]
    private let secondSection: [ItemPosition] = [.termsAndCond, .feedback, .support]
    private let thirdSection: [ItemPosition] = [.signout]
    
    var body: some View {
        ZStack {
            Color.BG
            settingScrollSection
        }
        .overlay(alignment: .top) {
            topContentSection
        }
        .ignoresSafeArea()
    }
}

private extension ProfileView {
    var topContentSection: some View {
        VStack(spacing: 25) {
            Text("My profile")
                .font(Font.Jakarta.medium(size: 19))
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    BackNavigationButtonView()
                        .padding(.leading, 20)
                        .padding(.top, safeAreaInsets.top - 20)
                }
            
            HStack(spacing: 16) {
                ZStack {
                    if let url = session.currentUser?.photoURL {
                        KFImage.url(url)
                            .resizable()
                            .fade(duration: 0.25)
                            .scaledToFill()
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .renderingMode(.template)
                            .padding(22)
                            .foregroundStyle(.lime)
                            .background(Color.davyGray)
                    }
                }
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .fill(.lime)
                        .frame(width: 18, height: 18)
                        .offset(x: -3)
                }
                
                VStack(alignment: .leading, spacing: -2) {
                    Text(session.currentUser?.fullname ?? "")
                        .font(Font.Jakarta.bold(size: 18))
                        .padding(.bottom, 6)
                    Text("Pro Member")
                        .font(Font.Jakarta.regular(size: 13))
                        .foregroundStyle(.dimGray)
                    Text(session.userSession?.metadata.creationDate?.formatted(date: .abbreviated, time: .shortened) ?? "")
                        .font(Font.Jakarta.regular(size: 15))
                        .foregroundStyle(.lime)
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal, .bottom], 20)
        }
        .foregroundStyle(.tint)
        .background(Color.raisinBlack)
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
    
    var settingScrollSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                BoxView {
                    VStack {
                        ForEach(firstSection, id: \.title) { item in
                            ProfileCellView(item: item)
                        }
                    }
                    .padding(.bottom, 10)
                }
                .padding(.top, 235)
                
                BoxView {
                    VStack {
                        ForEach(secondSection, id: \.title) { item in
                            ProfileCellView(item: item)
                        }
                    }
                    .padding(.bottom, 10)
                }
                
                BoxView {
                    ForEach(thirdSection, id: \.title) { item in
                        ProfileCellView(item: item) {
                            session.signOut()
                        }
                    }
                    .padding(.bottom, 10)
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, safeAreaInsets.bottom)
    }
}

#Preview {
    ProfileView()
        .environmentObject(SessionManager())
}
