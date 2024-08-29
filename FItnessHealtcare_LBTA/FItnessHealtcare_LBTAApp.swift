//
//  FItnessHealtcare_LBTAApp.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI

@main
struct FItnessHealtcare_LBTAApp: App {
    
    @StateObject private var session = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environmentObject(session)
        }
    }
}
