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
    @StateObject var commentModel: LoadCommentsVM

    init(id: Int) {
        self._model = StateObject(wrappedValue: SpecificPostVM(id: id))
        self._commentModel = StateObject(wrappedValue: LoadCommentsVM(postId: id))
    }


    var body: some View {
//        if self.commentModel.commentsVM == nil {
//            Text("loading")
//        }else {
//                        VStack {
//                            Text(self.commentModel.commentsVM.name).font(.title2)
//                            Text(self.commentModel.commentsVM.body).font(.body)
//                        }
//
//        }

        if let post = self.model.postVM   {
            VStack {
                Text(post.title).font(.title2).fontWeight(.semibold).foregroundColor(Color.white).padding()
                Text(post.body).font(.body).foregroundColor(Color.white).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                Spacer()
                Text("Comments").font(.title2)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                
                List(self.commentModel.commentsVM,id: \.id){ post in
                    
                    VStack {
                        Text(post.name).font(.title2).foregroundColor(Color.white).multilineTextAlignment(.leading)
                        Text(post.body).font(.body).foregroundColor(Color.white).multilineTextAlignment(.leading)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 350.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        
                    
                }
                
                

//                Spacer()

            }
            .padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)

        } else {
            Text("loading")
        }

//        Text(self.commentModel.commentsVM?.name ?? "loading")
        



    }
}


struct ViewPostView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPostView(id: 1)
        ViewPostView(id: 2)
    }
}
