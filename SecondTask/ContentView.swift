//
//  ContentView.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

