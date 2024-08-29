//
//  LoginViewModel.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 26.08.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func textFieldNotEmpty() -> Bool {
        email.isEmpty || password.isEmpty
    }
}
