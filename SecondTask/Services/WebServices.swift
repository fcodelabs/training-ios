//
//  Webservice.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation

class WebServices {
    let baseUrl = "https://jsonplaceholder.typicode.com/posts/"
    
    func getAllPosts(completion: @escaping ([Post]) -> ()) {
        
        guard let url = URL(string: baseUrl)
        else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url){ data, _, _ in
            let posts = try!
                JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
    
    func getSpecificPost(id: Int,completion: @escaping (Post) -> ()) {

        guard let url = URL(string: "\(baseUrl)\(id)")
        else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url){ data, _, _ in
            let post = try!
                JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(post)
            }
        }.resume()
    }
    
    func loadComments(postId:Int,completion: @escaping ([Comment]) -> ()) {
        
        guard let url = URL(string: "\(baseUrl)\(postId)/comments")
        else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url){ data, _, _ in
            let comments = try!
                JSONDecoder().decode([Comment].self, from: data!)
            DispatchQueue.main.async {
                completion(comments)
            }
        }.resume()
    }
}
