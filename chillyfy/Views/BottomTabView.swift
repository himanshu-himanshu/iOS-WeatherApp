//  File Name: BottomTabView.swift

//  Authors: Himanshu (301296001) & Gurminder (301294300)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Assignment 4 Part 1

//  Task: Creating Weather App

//  Date modified: 26/03/2023

import SwiftUI

struct BottomTabView: View {
    
    @State var selectedTab = "Home"
    @Binding var isLoggedIn: Bool
    
//    init() {
//        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            withAnimation {
                
            TabView(selection: $selectedTab) {
                WeatherInitialView(cityName: "Brampton")
                        .ignoresSafeArea(.all, edges: .all)
                        .tag("Home")
                    
                    WeatherMapView()
                        .ignoresSafeArea(.all, edges: .all)
                        .tag("Map")
                    
                    SavedCitiesView()
                        .ignoresSafeArea(.all, edges: .all)
                        .tag("Heart")
                    
                SettingView(isLoggedIn: $isLoggedIn)
                        .ignoresSafeArea(.all, edges: .all)
                        .tag("Setting")
                }
            }
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) {image in
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedTab = image
                        }
                    }, label: {
                        Image(image)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .foregroundColor(selectedTab == image ? getColor(image: image) : Color.gray)
                    })
                    
                    if image != tabs.last{Spacer(minLength: 0)}
                    
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(Color("Primary"))
            .cornerRadius(50)
            .padding(.horizontal)
            .padding(.vertical, 0)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    func getColor(image: String)->Color{
        switch image {
        case "Home":
            return Color("Gradient2")
        case "Setting":
            return Color("Purple")
        case "Map":
            return Color("Secondary")
        case "Heart":
            return Color("Orange")
        default:
            return Color.blue
        }
    }
}

struct BottomTabView_Previews: PreviewProvider {
    @State static var isLoggedIn = true
    static var previews: some View {
        BottomTabView(isLoggedIn: $isLoggedIn)
    }
}

var tabs = ["Home", "Map", "Heart","Setting"]
