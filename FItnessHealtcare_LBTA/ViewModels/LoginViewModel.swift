//
//  LoginViewModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 26.08.2024.
//

import Foundation
import Firebase
import CryptoKit

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullname: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    
    func createUserTextFieldNotEmpty() -> Bool {
        email.isEmpty || password.isEmpty || repeatPassword.isEmpty || fullname.isEmpty
    }
    
    func loginTextFieldNotEmpty() -> Bool {
        email.isEmpty || password.isEmpty
    }
}
