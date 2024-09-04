//
//  SessionManager.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 12.08.2024.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

enum RouterDestination: Hashable {
    case login
    case tabbar
    case home
    case meal
    case workout
    case statistics
    case plan
    case profile 
    case workoutDetail(WorkoutModel)
    case mealDetail(MealModel)
    case trainerDetail(WorkoutModel)
    case appointment(WorkoutModel)
}

@MainActor
final class SessionManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    @Published var path: [RouterDestination] = []
    @Published var transition: Bool = false
    @Published var startSearchPeople: Bool = false
    @Published var selectedTab: TabType = .workout
    @Published var isPremium: Bool = false
    @Published var isSuccessful: Bool = false
    @Published var isShowWorkoutView: Bool = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func navigate(to: RouterDestination) {
        path.append(to)
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, fullname: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            let user = User(
                id: result.user.uid,
                fullname: fullname,
                email: email
            )
            
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.path.removeAll()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("DEBUG: User not logged in")
            return
        }

        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            if snapshot.exists {
                self.currentUser = try snapshot.data(as: User.self)
            } else {
                print("DEBUG: Document for user \(uid) does not exist.")
            }
        } catch {
            print("DEBUG: Error fetching user data: \(error.localizedDescription)")
        }
    }
}
