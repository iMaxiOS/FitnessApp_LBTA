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
import FirebaseStorage
import PhotosUI

enum DestinationPopupView {
    case error, congratulation
}

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
    @Published var isSignInError: Bool = false
    @Published var errorMessage: String = ""
    @Published var selectedTab: TabType = .workout
    @Published var isPremium: Bool = false
    @Published var isSuccessful: Bool = false
    @Published var isShowWorkoutView: Bool = false
    @Published var selectedImage: UIImage? = nil
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            if let selectedPhoto {
                Task {
                  await processPhoto(photo: selectedPhoto)
                }
            }
        }
    }
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    private let storage = Storage.storage()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    private func processPhoto(photo: PhotosPickerItem) async {
        Task {
            do {
                let data = try await selectedPhoto?.loadTransferable(type: Data.self)
                
                guard let data, let image = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                
                self.selectedImage = image
            } catch let error {
                print(error)
            }
        }
    }
    
    
    func navigate(to: RouterDestination) {
        path.append(to)
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            withAnimation(.bouncy) {
                isSignInError.toggle()
            }
            
            errorMessage = error.localizedDescription
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, fullname: String, password: String) async throws {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            if let selectedImage = selectedImage {
                let imageURL = try await uploadProfileImage(image: selectedImage, userId: result.user.uid)
                
                if let imageURL = imageURL {
                    try await saveUserDetails(userId: result.user.uid, fullname: fullname, email: email, photoURL: imageURL)
                }
            } else {
                try await saveUserDetails(userId: result.user.uid, fullname: fullname, email: email)
            }
            
            await fetchUser()
        } catch {
            withAnimation(.bouncy) {
                isSignInError.toggle()
            }
            
            errorMessage = error.localizedDescription
            
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func saveUserDetails(userId: String, fullname: String, email: String, photoURL: URL? = nil) async throws {
        let user = User(id: userId, fullname: fullname, email: email, photoURL: photoURL)
        let encodeUser = try Firestore.Encoder().encode(user)
        
        try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    }
    
    func uploadProfileImage(image: UIImage, userId: String) async throws -> URL? {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {
            return nil
        }
        
        let storageRef = storage.reference(withPath: "profile_images/\(userId).jpeg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        _ = try await storageRef.putDataAsync(imageData, metadata: metadata)
        let downloadURL = try await storageRef.downloadURL()
        return downloadURL
    }
    
    func signOut() {
        do {
            try auth.signOut()
            path.removeAll()
            userSession = nil
            currentUser = nil
            selectedImage = nil
        } catch {
            print("DEBUG: Failed to sign out with error")
        }
    }
    
    func fetchUser() async {
        guard let uid = auth.currentUser?.uid else {
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
