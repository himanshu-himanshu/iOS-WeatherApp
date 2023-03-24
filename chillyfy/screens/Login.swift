//
//  Login.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-24.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    
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
                            .frame(maxWidth: .infinity, maxHeight: 28)
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
                            .frame(maxWidth: .infinity, maxHeight: 28)
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(50)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Login")
                                .frame(maxWidth: .infinity, maxHeight: 44)
                                .font(.custom("Raleway", size: 24))
                                .fontWeight(Font.Weight.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.pink.opacity(0.7))
                    }
                    .cornerRadius(50)
                    .padding(.vertical)
                    
                    Spacer()
                        .frame(height: 60)

                    Button {
                        
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
