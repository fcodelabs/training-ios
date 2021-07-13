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

struct HomeView: View {
    @StateObject var model = PostListVM()
    
    var body: some View {
        NavigationView {
            List(self.model.posts,id: \.id ){ post in
                NavigationLink(
                    destination: ViewPostView(id:post.id),
                    label: {
                        VStack {
                            Text(post.title).font(.title2)
                            Text(post.body).font(.body)
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 350.0).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/).cornerRadius(10)
                    })
                
            }
            .navigationTitle("Posts")
            .toolbar {
                NavigationLink(
                    destination: NewPostView(),
                    label: {
                        Image(systemName: "plus")
                    })
            }
        }
    }
}

struct ProfileView: View {
    
    var body: some View {
        NavigationView {
            Text("Profile Page")
                .navigationTitle("Profile")
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

