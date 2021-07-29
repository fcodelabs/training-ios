//
//  SpecificPostVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-10.
//

import Foundation

class SpecificPostVM: ObservableObject {
    @Published var postVM: PostViewModel? = nil
    @Published var commentsVM = [LoadCommentModel]()

    init(id: Int) {
        WebServices().getSpecificPost(id: id) { post in
            self.postVM = PostViewModel(post: post)
        }

//        WebServices().testMethod(id: id) { x, y, z in
//            <#code#>
//        }
//        WebServices().getSpecificPost(id: id, completion: self.abc(_:))
    }

    init(postId: Int) {
        WebServices().loadComments(postId: postId) { comments in
            self.commentsVM = comments.map(LoadCommentModel.init)
        }
    }

//
//    func abc(_ value: Post) {
//        self.postVM = PostViewModel(post: value)
//    }
}

struct LoadCommentModel {
    var comment: Comment

    init(comment: Comment) {
        self.comment = comment
    }

    var postId: Int {
        return comment.postId
    }

    var id: Int {
        return comment.id
    }

    var name: String {
        return comment.name
    }

    var body: String {
        return comment.body
    }
}
