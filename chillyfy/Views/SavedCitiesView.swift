//
//  SavedCitiesView.swift
//  chillyfy
//
//  Created by Himanshu on 2023-03-26.
//

import SwiftUI

struct SavedCitiesView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient3"), Color("Gradient4")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Saved Cities")
                    .font(.custom("Fasthand-Regular", size: 38))
                    .foregroundColor(Color.white)
                
            }
            
        }.ignoresSafeArea(.all)
    }
}

struct SavedCitiesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCitiesView()
    }
}
