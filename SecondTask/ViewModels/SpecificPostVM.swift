//
//  SpecificPostVM.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-10.
//

import Foundation

class SpecificPostVM: ObservableObject {
    @Published var postVM: PostViewModel? = nil
    
    init(id: Int) {
        WebServices().getSpecificPost(id: id) { post in
            self.postVM = PostViewModel(post: post)
        }
        
//        WebServices().testMethod(id: id) { x, y, z in
//            <#code#>
//        }
//        WebServices().getSpecificPost(id: id, completion: self.abc(_:))
    }
//
//    func abc(_ value: Post) {
//        self.postVM = PostViewModel(post: value)
//    }
}


