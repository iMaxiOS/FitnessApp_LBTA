//
//  LoginView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 21.08.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionManager
    
    enum RouterAccount {
        case onboarding, login, create, forget
    }
    
    @State private var isRemember: Bool = false
    @State private var router: RouterAccount = .onboarding
    
    @StateObject private var vm = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image(.bg)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(0.8)
                .blur(radius: 8)
            
            VStack {
                switch router {
                case .onboarding:
                    loginOrCreateView
                case .login:
                    loginView
                case .create:
                    createView
                case .forget:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .buttonStyle(.plain)
        .overlay(alignment: .topTrailing) {
            signUpButton
                .opacity(router != .login ? 0 : 1)
        }
        .overlay {
            if session.isShowWorkoutView {
                TabbarView()
            }
        }
    }
}

private extension LoginView {
    
    var imageBG: some View {
        Image(.bg)
            .resizable()
            .scaledToFill()
            .clipped()
    }
    
    var loginOrCreateView: some View {
        VStack {
            Button {
                withAnimation(.spring) {
                    router = .login
                }
            } label: {
                Capsule()
                    .fill(.lime)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        Text("Login")
                            .font(Font.Jakarta.bold(size: 17))
                            .foregroundStyle(.raisinBlack)
                    }
            }
            
            HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 1)
                Text("OR")
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 1)
            }
            .foregroundStyle(.white.opacity(0.7))
            .frame(height: 40)
            
            Button {
                withAnimation(.spring) {
                    router = .create
                }
            } label: {
                Capsule()
                    .stroke(lineWidth: 1)
                    .fill(.lime)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        Text("Create an account")
                            .font(Font.Jakarta.bold(size: 17))
                            .foregroundStyle(.lime)
                    }
            }
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 40)
        .padding(.bottom, 50)
        .transition(.move(edge: .leading))
    }
    
    var signUpButton: some View {
        Button {
            withAnimation(.spring) {
                router = .create
            }
        } label: {
            Text("Sign up")
                .font(Font.Jakarta.bold(size: 17))
                .foregroundStyle(.lime)
                .frame(width: 100, height: 50)
                .padding(.trailing, 20)
        }
    }
    
    var loginView: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome back!")
                    .font(Font.Jakarta.bold(size: 34))
                Text("Log back into your account")
                    .font(Font.Jakarta.medium(size: 15))
                    .foregroundStyle(.lime)
            }
            .foregroundStyle(.raisinBlack)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    TextField("Your Email", text: $vm.email)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                VStack(spacing: 0) {
                    TextField("Password", text: $vm.password)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                HStack {
                    Toggle("", isOn: $isRemember)
                        .fixedSize()
                        .tint(.lime)
                    
                    Text("Remember")
                        .foregroundStyle(.raisinBlack)
                    
                    Spacer()
                    
                    Button {} label: {
                        Text("Forgot?")
                    }
                }
                .buttonStyle(.plain)
                .foregroundStyle(.lime)
                .font(Font.Jakarta.medium(size: 16))
                
                Button {
                    withAnimation(.spring) {
                        session.isShowWorkoutView.toggle()
                    }
                } label: {
                    Capsule()
                        .fill(.lime)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            Text("Login")
                                .font(Font.Jakarta.bold(size: 17))
                                .foregroundStyle(.raisinBlack)
                        }
                }
                .padding(.top)
                .disabled(vm.textFieldNotEmpty())
            }
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 50)
        .transition(.move(edge: .trailing))
    }
    
    var createView: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Create account!")
                    .font(Font.Jakarta.bold(size: 34))
                Text("Sign up and start getting fit")
                    .font(Font.Jakarta.medium(size: 15))
                    .foregroundStyle(.lime)
            }
            .foregroundStyle(.raisinBlack)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    TextField("Your Email", text: $vm.email)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                VStack(spacing: 0) {
                    TextField("Password", text: $vm.password)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                Button {
                    session.isShowWorkoutView.toggle()
                } label: {
                    Capsule()
                        .fill(.lime)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            Text("Sign up")
                                .font(Font.Jakarta.bold(size: 17))
                                .foregroundStyle(.raisinBlack)
                        }
                }
                .padding(.top)
                .disabled(vm.textFieldNotEmpty())
                
                Button { } label: {
                    Capsule()
                        .stroke(lineWidth: 1)
                        .fill(.lime)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            Text("Continue with Facebook")
                                .font(Font.Jakarta.bold(size: 17))
                                .foregroundStyle(.lime)
                        }
                }
                
                HStack {
                    Text("Terms of Use")
                    
                    Text("and")
                        .font(Font.Jakarta.medium(size: 12))
                    Text("Privacy Policy")
                }
                .foregroundStyle(.raisinBlack)
                .font(Font.Jakarta.bold(size: 12))
                .padding(.top)
            }
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 50)
        .transition(.move(edge: .trailing))
    }
}

#Preview {
    LoginView()
        .environmentObject(SessionManager())
}
