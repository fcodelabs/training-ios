//
//  PostListVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation
import SwiftUI
import Combine

class PostListVM: ObservableObject {
    @Published var posts = [PostViewModel]()

    init() {
        
        WebServices().getAllPosts { posts in
            self.posts = posts.map(PostViewModel.init)
            
            
        }
    }
    

}

//class PostVM: ObservableObject {
//    @Published var posts = [PostViewModel]()
//
//    init() {
//
//        WebServices().getSpecificPosts { posts in
//            self.posts = posts.map(PostViewModel.init)
//
//
//        }
//    }
//
//
//}
struct PostViewModel {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var id: Int {
        
        return self.post.id
    }
    
    var title: String {
        
        return self.post.title
    }
    var body: String {
        
        return self.post.body
    }
    
}
