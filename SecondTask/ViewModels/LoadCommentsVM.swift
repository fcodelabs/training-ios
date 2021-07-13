//
//  PostListVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation
import SwiftUI
import Combine

class LoadCommentsVM: ObservableObject {
    @Published var commentsVM = [LoadCommentModel]()

    init(postId: Int) {

        WebServices().loadComments(postId: postId) { comments in
            self.commentsVM = comments.map(LoadCommentModel.init)

            
        }
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
