//
//  ViewPostScreen.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-09.
//

import Foundation
import SwiftUI

struct ViewPostView: View {
    @StateObject var model: SpecificPostVM
    @StateObject var commentModel: PostListVM

    init(id: Int) {
        _model = StateObject(wrappedValue: SpecificPostVM(id: id))
        _commentModel = StateObject(wrappedValue: PostListVM(postId: id))
    }

    var body: some View {
        if let post = self.model.postVM {
            VStack {
                Text(post.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding()

                Text(post.body)
                    .font(.body)
                    .foregroundColor(Color.white)
                    .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)

                Text("Comments")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)

                List(self.commentModel.commentsVM, id: \.id) { post in
                    VStack {
                        Text(post.name)
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)

                        Text(post.body)
                            .font(.body)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(/*@START_MENU_TOKEN@*/ .all, 0.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/ .all, 0.0/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
        } else {
            Text("loading")
        }

        //        if self.commentModel.commentsVM == nil {
        //            Text("loading")
        //        }else {
        //                        VStack {
        //                            Text(self.commentModel.commentsVM.name).font(.title2)
        //                            Text(self.commentModel.commentsVM.body).font(.body)
        //                        }
        //
        //        }
    }
}

struct ViewPostView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPostView(id: 1)
        ViewPostView(id: 2)
    }
}
