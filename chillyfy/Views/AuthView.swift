//
//  AuthView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-26.

import SwiftUI

struct AuthView: View {
    @State var isLoggedIn = false
    @State var currentAuthView = "Login"
    
    var body: some View {
        
        if isLoggedIn {
          BottomTabView()
        } else {
            if currentAuthView == "Login" {
                LoginView(currentAuthView: $currentAuthView, isLoggedIn: $isLoggedIn)
            }
            if currentAuthView == "Signup" {
                SignupView(currentAuthView: $currentAuthView)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

/**----------------------------------------------------*/
/**---------------- Login View  -----------------*/

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isShowingDetailView = false
    @Binding var currentAuthView: String
    @Binding var isLoggedIn: Bool
    
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
                        TextField("", text: $email)
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
                                self.isLoggedIn = true
                            }
                            
                        } label: {
                            Text("Login")
                                .frame(maxWidth: .infinity, maxHeight: 52)
                                .font(.custom("Raleway", size: 24))
                                .fontWeight(Font.Weight.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("Gradient2"))
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
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var isShowingDetailView = false
    @Binding var currentAuthView: String
    
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
                        if email.isEmpty {
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
                        TextField("", text: $email)
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
                            
                        } label: {
                            Text("Signup")
                                .frame(maxWidth: .infinity, maxHeight: 52)
                                .font(.custom("Raleway", size: 24))
                                .fontWeight(Font.Weight.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("Gradient2"))
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
