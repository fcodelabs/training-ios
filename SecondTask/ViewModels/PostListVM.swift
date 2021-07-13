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
    @Published var commentsVM = [LoadCommentModel]()

    init() {
        WebServices().getAllPosts { posts in
            self.posts = posts.map(PostViewModel.init)
        }
    }
    
    init(postId: Int) {
        WebServices().loadComments(postId: postId) { comments in
            self.commentsVM = comments.map(LoadCommentModel.init)
        }
    }
}

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

struct LoadCommentModel {
    var comment: Comment

    init(comment: Comment) {
        self.comment = comment
    }

    var postId: Int {
        return self.comment.postId
    }
    
    var id: Int {
        return self.comment.id
    }

    var name: String {
        return self.comment.name
    }
    
    var body: String {
        return self.comment.body
    }
}
