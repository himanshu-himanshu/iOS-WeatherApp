////
////  UserStateViewModel.swift
////  chillyfy
////
////  Created by Himanshu on 2023-04-16.
////
//
//import Foundation
//import FirebaseAuth
//import FirebaseCore
//import FirebaseFirestore
//
//enum UserStateError: Error{
//    case signInError, signOutError
//}
//
//@MainActor
//class UserStateViewModel: ObservableObject {
//    
//    @Published var isLoggedIn = false
//    @Published var isBusy = false
//    @Published var showErrorAlert = false
//    
//    func signIn(email: String, password: String) async -> Result<Bool, UserStateError>  {
//        isBusy = true
//      
//            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                if let error = error {
//                    self.showErrorAlert = true
//                    print(error)
//                    return
//                }
//                
//                if let authResult = authResult {
//                    AuthView.loggedUserID = authResult.user.uid
//                    self.isLoggedIn = true
//                }
//                self.isBusy = false
//            }
//            
//            return .success(true)
//    }
//    
//    func signUp(username: String, email: String, password: String) async -> Result<Bool, UserStateError>  {
//        let db = Firestore.firestore()
//        isBusy = true
//      
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//            if (error != nil) {
//                showErrorAlert = true
//                print(error!)
//                return
//            }
//            
//            if let authResult = authResult {
//                showAlert = true
//                userID = authResult.user.uid
//                
//                AuthView.loggedUserID = userID
//                
//                /** Write data into Firestore using ID returned after authentication */
//                db.collection("users").document(userID).setData([
//                    "email": email,
//                    "username": username,
//                    "savedCities": [],
//                    "theme": "dark"
//                ]) { err in
//                    if let err = err {
//                        print("Error writing document: \(err)")
//                    } else {
//                        print("Document successfully written!")
//                    }
//                }
//            }
//        }
//            
//            return .success(true)
//    }
//    
//    func signOut() async -> Result<Bool, UserStateError>  {
//        isBusy = true
//        do{
//            try await Task.sleep(nanoseconds: 1_000_000_000)
//            isLoggedIn = false
//            isBusy = false
//            return .success(true)
//        }catch{
//            isBusy = false
//            return .failure(.signOutError)
//        }
//    }
//}

import Foundation

class userLogInModel: ObservableObject {
    
    @Published var isLoggedIn = false
}
