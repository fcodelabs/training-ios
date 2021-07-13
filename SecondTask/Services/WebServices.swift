//
//  Webservice.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation

class WebServices {

    func getAllPosts(completion: @escaping ([Post]) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url){data, _, _ in
            let posts = try!
                JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async{
                completion(posts)
            }

        }.resume()
    }
    
    
    func getSpecificPost(id: Int,completion: @escaping (Post) -> ()) {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url){data, _, _ in
            let post = try!
                JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async{
                completion(post)
            }

        }.resume()
    }
    
    func loadComments(postId:Int,completion: @escaping ([Comment]) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments") else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url){data, _, _ in
            let comments = try!
                JSONDecoder().decode([Comment].self, from: data!)
            DispatchQueue.main.async{
                completion(comments)
            }

        }.resume()
    }
    
    
    
}
