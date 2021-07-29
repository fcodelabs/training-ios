//
//  PostListVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Combine
import Foundation
import SwiftUI

class PostListVM: ObservableObject {
    @Published var posts = [PostViewModel]()

    init() {
        WebServices().getAllPosts { posts in
            self.posts = posts.map(PostViewModel.init)
        }
    }
}

struct PostViewModel {
    var post: Post

    init(post: Post) {
        self.post = post
    }

    var id: Int {
        return post.id
    }

    var title: String {
        return post.title
    }

    var body: String {
        return post.body
    }
}
