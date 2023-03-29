//  File Name: Setting.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SettingView: View {
    @AppStorage("uid") var userID:String = ""
    let loggedUserId = AuthView.loggedUserID
    @State var userName = ""
    @State var userTheme = ""
    
    let db = Firestore.firestore()

    /** Fetch data from Firestore database using logged in user ID */
    func fetchDataFromFirestore() {
        
        let docRef = db.collection("users").document(loggedUserId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                userName = document.data()!["username"] as! String
                userName = "Hi, " + userName
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient7"), Color("Gradient8")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Settings")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
                Text(userName)
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
                Spacer()
                    .frame(height: 300)
                
                Button {
                    let firebaseAuth = Auth.auth()
                    do {
                      try firebaseAuth.signOut()
                        //userID = ""
                        print("Logged Out")
                    } catch let signOutError as NSError {
                      print("Error signing out: %@", signOutError)
                    }
                } label: {
                    Text("Logout")
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .font(.custom("Raleway", size: 18))
                        .fontWeight(Font.Weight.semibold)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Gradient3"))
                .padding(.horizontal, 50)
            }
            
        }
        .ignoresSafeArea(.all)
        .onAppear {
            self.fetchDataFromFirestore()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
