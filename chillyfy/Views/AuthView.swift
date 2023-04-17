//  File Name: AuthView.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct AuthView: View {
    @AppStorage("uid") var userID:String = ""
    @State var isLoggedIn = false
    @State var currentAuthView = "Login"
    static var loggedUserID = ""
    
    var body: some View {
        if isLoggedIn {
            BottomTabView(isLoggedIn: $isLoggedIn)
                .transition(.move(edge: .trailing))
        } else {
            if currentAuthView == "Login" {
                LoginView(currentAuthView: $currentAuthView, isLoggedIn: $isLoggedIn)
            }
            if currentAuthView == "Signup" {
                SignupView(currentAuthView: $currentAuthView, isLoggedIn: $isLoggedIn)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

/**----------------------------------------------------*/
/**---------------- Login View  -----------------*/

struct LoginView: View {
    @AppStorage("uid") var userID:String = ""
    @State var email: String = "him@yopmail.com"
    @State var password: String = "himanshu"
    @State var isShowingDetailView = false
    @Binding var currentAuthView: String
    @Binding var isLoggedIn: Bool
    @State var showErrorAlert = false
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 20)
                Image("cloudy")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 100, alignment: .bottom)
                
                Text("Login now")
                    .font(.custom("Fasthand-Regular", size: 52))
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color.white)
                
                
                VStack {
                    ZStack {
                        if email.isEmpty {
                            Text("Email")
                                .foregroundColor(Color.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack {
                            TextField("", text: $email)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 38)
                                .autocapitalization(.none)
                                .autocorrectionDisabled(true)
                            if(email.count != 0) {
                                Image(systemName: email.isEmailValid() ? "checkmark" : "xmark")
                                    .foregroundColor(email.isEmailValid() ? Color("Gradient2") : .red)
                                    .fontWeight(.bold)
                            }

                        }
                        
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(50)
                    
                    
                    ZStack {
                        if password.isEmpty {
                            Text("Password")
                                .foregroundColor(Color.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        SecureField("", text: $password)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 38)
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(50)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Button {
                            withAnimation {
                                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                    if let error = error {
                                        showErrorAlert = true
                                        print(error)
                                        return
                                    }
                                    
                                    if let authResult = authResult {
                                        AuthView.loggedUserID = authResult.user.uid
                                        email = ""
                                        password = ""
                                        withAnimation {
                                            //userID = authResult.user.uid
                                            isLoggedIn = true
                                        }
                                        print(authResult.user.uid)
                                    }
                                }
                            }
                            
                        } label: {
                            Text("Login")
                                .frame(maxWidth: .infinity, maxHeight: 52)
                                .font(.custom("Raleway", size: 24))
                                .fontWeight(Font.Weight.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("Gradient2"))
                        .alert("Error", isPresented: $showErrorAlert) {
                            Button("OK", role: .cancel, action: {
                                isLoggedIn = false
                            })
                        } message: {
                            Text("Something went wrong! Try again")
                        }
                    }
                    .cornerRadius(50)
                    .padding(.vertical)
                    
                    Spacer()
                        .frame(height: 60)
                        Button {
                            withAnimation {
                                self.currentAuthView = "Signup"
                            }
                        } label: {
                            Text("Don't have an account? Signup")
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

/**----------------------------------------------------*/
/**---------------- Signup View  -----------------*/


struct SignupView: View {
    @AppStorage("uid") var userID:String = ""
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var isShowingDetailView = false
    @Binding var currentAuthView: String
    @State var showAlert = false
    @State var showErrorAlert = false
    @Binding var isLoggedIn: Bool
    
    let db = Firestore.firestore()
    
    /** Function to register user to firebase also to create user into Firestore database */
    func registerUserToFirebase() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if (error != nil) {
                showErrorAlert = true
                print(error!)
                return
            }
            
            if let authResult = authResult {
                showAlert = true
                userID = authResult.user.uid
                
                AuthView.loggedUserID = userID
                
                /** Write data into Firestore using ID returned after authentication */
                db.collection("users").document(userID).setData([
                    "email": email,
                    "username": username,
                    "savedCities": [],
                    "theme": "dark"
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                username = ""
                email = ""
                password = ""
                print("User ID: ", userID)
            }
        }
    }

    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
           
            VStack {
                Spacer()
                    .frame(height: 20)
                Image("cloudy")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 100, alignment: .bottom)
                
                Text("Register now")
                    .font(.custom("Fasthand-Regular", size: 52))
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color.white)
                    
                
                VStack {
                    ZStack {
                        if username.isEmpty {
                            Text("Username")
                                .foregroundColor(Color.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("", text: $username)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 38)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(50)
                    
                    ZStack {
                        if email.isEmpty {
                            Text("Email")
                                .foregroundColor(Color.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack {
                            TextField("", text: $email)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 38)
                                .autocapitalization(.none)
                                .autocorrectionDisabled(true)
                            if(email.count != 0) {
                                Image(systemName: email.isEmailValid() ? "checkmark" : "xmark")
                                    .foregroundColor(email.isEmailValid() ? Color("Gradient2") : .red)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(50)
             
                    
                    ZStack {
                        if password.isEmpty {
                            Text("Password")
                                .foregroundColor(Color.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        SecureField("", text: $password)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 38)
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(50)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Button {
                            withAnimation {
                                registerUserToFirebase()
                            }
                            
                        } label: {
                            Text("Signup")
                                .frame(maxWidth: .infinity, maxHeight: 52)
                                .font(.custom("Raleway", size: 24))
                                .fontWeight(Font.Weight.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("Gradient2"))
                        .alert("User Registered", isPresented: $showAlert) {
                            Button("OK", role: .cancel, action: {
                                isLoggedIn = true
                            })
                        } message: {
                            Text("Registration successfull!")
                        }
                        .alert("Error", isPresented: $showErrorAlert) {
                            Button("OK", role: .cancel, action: {
                                isLoggedIn = false
                            })
                        } message: {
                            Text("Something went wrong! Try again")
                        }
                    }
                    .cornerRadius(50)
                    .padding(.vertical)
                    
                    Spacer()
                        .frame(height: 40)

                    Button {
                        withAnimation {
                            self.currentAuthView = "Login"
                        }
                        
                    } label: {
                        Text("Already a member? Login")
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity)
                    .padding()
                }
      
                Spacer()
            }
            .padding()
        }
    }
}



struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
