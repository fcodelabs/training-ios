//
//  Webservice.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation

class WebService {

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
}
