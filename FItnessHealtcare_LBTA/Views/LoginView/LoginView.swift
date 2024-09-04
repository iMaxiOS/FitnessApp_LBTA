//
//  LoginView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 21.08.2024.
//

import SwiftUI

struct LoginView: View {
    enum RouterAccount {
        case onboarding, login, create, forget
    }
    
    enum FocusedFieldLogin {
        case email, password
    }
    
    enum FocusedFieldCreateAuth {
        case email, fullname, password, repeatPassword
    }
    
    @EnvironmentObject var session: SessionManager
    
    @State private var isRemember: Bool = false
    @State private var router: RouterAccount = .onboarding
    
    @FocusState private var focusedFieldForLogin: FocusedFieldLogin?
    @FocusState private var focusedFieldForCreate: FocusedFieldCreateAuth?
    
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
            if session.userSession != nil {
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
                hideKeyboard()
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
                        .keyboardType(.emailAddress)
                        .submitLabel(.next)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.words)
                        .focused($focusedFieldForLogin, equals: .email)
                        .frame(height: 45)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                VStack(spacing: 0) {
                    SecureField("Password", text: $vm.password)
                        .frame(height: 45)
                        .foregroundStyle(.raisinBlack)
                        .submitLabel(.done)
                        .focused($focusedFieldForLogin, equals: .password)
                    
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
                    Task {
                        try await session.signIn(email: vm.email, password: vm.password)
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
                .disabled(vm.loginTextFieldNotEmpty())
            }
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 30)
        .transition(.move(edge: .trailing))
        .onSubmit {
            switch focusedFieldForLogin {
            case .email: focusedFieldForLogin = .password
            case .password: focusedFieldForLogin = nil
            case .none: break
            }
        }
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
                        .keyboardType(.emailAddress)
                        .submitLabel(.next)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.words)
                        .frame(height: 45)
                        .focused($focusedFieldForCreate, equals: .email)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                VStack(spacing: 0) {
                    TextField("Full Name", text: $vm.fullname)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                        .focused($focusedFieldForCreate, equals: .fullname)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                VStack(spacing: 0) {
                    SecureField("Password", text: $vm.password)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                        .focused($focusedFieldForCreate, equals: .password)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                VStack(spacing: 0) {
                    SecureField("Repeat password", text: $vm.repeatPassword)
                        .foregroundStyle(.raisinBlack)
                        .frame(height: 45)
                        .focused($focusedFieldForCreate, equals: .repeatPassword)
                    
                    RoundedRectangle(cornerRadius: 1)
                        .fill(.raisinBlack.opacity(0.5))
                        .frame(height: 1)
                }
                
                Button {
                    Task {
                        try await session.createUser(
                            email: vm.email,
                            fullname: vm.fullname,
                            password: vm.password
                        )
                    }
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
                .disabled(vm.createUserTextFieldNotEmpty())
                
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
        .onSubmit {
            switch focusedFieldForCreate {
            case .email: focusedFieldForCreate = .fullname
            case .fullname: focusedFieldForCreate = .password
            case .password: focusedFieldForCreate = .repeatPassword
            case .repeatPassword: focusedFieldForCreate = nil
            case .none: break
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(SessionManager())
}
