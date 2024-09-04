//
//  FItnessHealtcare_LBTAApp.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI
import Firebase

@main
struct FItnessHealtcare_LBTAApp: App {
    
    @StateObject private var session = SessionManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environmentObject(session)
        }
    }
}
