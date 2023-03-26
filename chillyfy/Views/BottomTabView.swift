//
//  BottomTabView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-26.
//

import SwiftUI

struct BottomTabView: View {
    @State var selectedTab = "Home"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                
                WeatherView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Home")
                
                WeatherMapView()
                     .ignoresSafeArea(.all, edges: .all)
                     .tag("Map")
                
                SavedCitiesView()
                     .ignoresSafeArea(.all, edges: .all)
                     .tag("Heart")
                
                SettingView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Setting")
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
            return Color("Orange")
        case "Heart":
            return Color("Secondary")
        default:
            return Color.blue
        }
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}

var tabs = ["Home", "Map", "Heart","Setting"]
