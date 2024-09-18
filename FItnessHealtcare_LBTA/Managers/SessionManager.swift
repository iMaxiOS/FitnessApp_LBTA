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
import AuthenticationServices
import CryptoKit
import FBSDKLoginKit

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
final class SessionManager: NSObject, ObservableObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    @Published private var currentNonce: String?
    
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
    
    override init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func startSignInWithAppleFlow() {
        let nonce = randomNonceString()
        currentNonce = nonce
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    // MARK: - Обработка результата авторизации
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("DEBUG: Failed to log with error, cant get token")
                return
            }
            
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("DEBUG: Failed with error: \(appleIDToken.debugDescription)")
                return
            }
            
            Task {
                do {
                    let credential = OAuthProvider.credential(providerID: .apple, idToken: idTokenString, rawNonce: nonce)
                    let authResult = try await Auth.auth().signIn(with: credential)
                    
                    userSession = authResult.user
                    
                    if let name = appleIDCredential.fullName {
                        try await saveUserDetails(
                            userId: authResult.user.uid,
                            fullname: name.givenName ?? "",
                            email: authResult.user.email ?? ""
                        )
                    }
                    
                    await fetchUser()
                } catch {
                    withAnimation(.bouncy) {
                        isSignInError.toggle()
                    }
                    
                    errorMessage = error.localizedDescription
                    print("DEBUG: Error signing in with Apple: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        withAnimation(.bouncy) {
            isSignInError.toggle()
        }
        
        errorMessage = "Authorization failed: \(error.localizedDescription)"
        print("DEBUG: Authorization failed: \(error.localizedDescription)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}

extension SessionManager {
    func processPhoto(photo: PhotosPickerItem) async {
        Task {
            do {
                let data = try await selectedPhoto?.loadTransferable(type: Data.self)
                
                guard let data, let image = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                
                self.selectedImage = image
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func navigate(to: RouterDestination) {
        path.append(to)
    }
    
    //MARK: - Sign in with Email
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            userSession = result.user
            
            await fetchUser()
        } catch {
            withAnimation(.bouncy) {
                isSignInError.toggle()
            }
            
            errorMessage = error.localizedDescription
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    //MARK: - Sign in with Facebook
    func signInWithFacebook() async throws {
        let loginManager = LoginManager()
        
        let result = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<String, Error>) in
            loginManager.logIn(permissions: ["email"], from: nil) { loginResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = loginResult, !result.isCancelled, let tokenString = result.token?.tokenString {
                    continuation.resume(returning: tokenString)
                } else {
                    continuation.resume(throwing: NSError(domain: "FacebookLoginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Login was canceled."]))
                }
            }
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: result)
        let authResult = try await Auth.auth().signIn(with: credential)
        userSession = authResult.user
        
        try await saveUserDetails(
            userId: authResult.user.uid,
            fullname: authResult.user.displayName ?? "",
            email: authResult.user.email ?? ""
        )
        
        await fetchUser()
    }
    
    //MARK: - Sign in with Google
    
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

private extension SessionManager {
    func randomNonceString(length: Int = 32) -> String {
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0..<16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("DEBUG: SecRandomCopyBytes return error.")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}
