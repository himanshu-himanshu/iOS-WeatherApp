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
    @State var userEmail = ""
    @State var darkTheme = true
    @State var showLogOut = false
    @Binding var isLoggedIn: Bool
    
    let db = Firestore.firestore()

    /** Fetch data from Firestore database using logged in user ID */
    func fetchDataFromFirestore() {
        
        let docRef = db.collection("users").document(loggedUserId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                userName = document.data()!["username"] as! String
                userEmail = document.data()!["email"] as! String
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("DarkGray")]), startPoint: .leading, endPoint: .trailing)
                
                VStack {
                    Spacer()
                        .frame(height: 60)
                    
                    HStackLayout() {
                        Text("Settings")
                            .font(.custom("Fasthand-Regular", size: 44))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .bottom)
                        .clipped()
                        .shadow(radius: 3)
                    
                    Spacer()
                        .frame(height:30)
                    
                    Form {
                        Section(header: Text("Personal Information")) {
                           
                                HStack {
                                    Text("Username")
                                        .foregroundColor(Color("Primary"))
                                    Spacer()
                                    Text(userName)
                                        .foregroundColor(.gray)
                                }
                     

                            HStack {
                                Text("Email")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                                Text(userEmail)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Section(header: Text("About Us")) {
                            NavigationLink(destination: AboutView(), label: {
                                HStack {
                                    Button(action: {
                                        
                                    }) {
                                        Text("About App")
                                            .foregroundColor(.blue)
                                    }
                                }
                            })
                            
                            NavigationLink(destination: AboutView(), label: {
                                HStack {
                                    Link("Terms of Service", destination: URL(string: "https://google.com")!)
                                }
                            })
                        }
                        
                        Section(header: Text("Account Actions")) {
                            Toggle("Dark Theme", isOn: $darkTheme)
                                .tint(Color("Gradient2"))
                                .foregroundColor(Color("Primary"))
                   
                                HStack {
                                    Button(action: {
                                        withAnimation {
                                            showLogOut = true
                                        }
                                    }) {
                                        Text("Log Out")
                                            .foregroundColor(Color(.red))
                                    }
                                }
                     
                        }
                    }
                }
            }
            .ignoresSafeArea(.all)
            .onAppear {
                self.fetchDataFromFirestore()
            }
            .navigationTitle("")
        }.actionSheet(isPresented: $showLogOut) {
            .init(title: Text(""), message: Text("Do you want to log out?"), buttons: [
                .destructive(Text("Log Out"), action: {
                    withAnimation {
                        isLoggedIn = false
                    }
                }),
                .cancel()
            ])
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    static var previews: some View {
        SettingView(isLoggedIn: $isLoggedIn)
    }
}
