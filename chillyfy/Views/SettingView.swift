//
//  SettingView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-26.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient7"), Color("Gradient8")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Setting View")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
            }
            
        }.ignoresSafeArea(.all)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
