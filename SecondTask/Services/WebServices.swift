//
//  Webservice.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation

class WebServices {
    let baseUrl = "https://jsonplaceholder.typicode.com/posts/"

    func getAllPosts(completion: @escaping ([Post]) -> Void) {
        guard let url = URL(string: baseUrl)
        else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let posts = try!
                JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }

    func getSpecificPost(id: Int, completion: @escaping (Post) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(id)")
        else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let post = try!
                JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(post)
            }
        }.resume()
    }

    func loadComments(postId: Int, completion: @escaping ([Comment]) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(postId)/comments")
        else {
            fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let comments = try!
                JSONDecoder().decode([Comment].self, from: data!)
            DispatchQueue.main.async {
                completion(comments)
            }
        }.resume()
    }

    func sendSensorData(acceleroDataX: String,acceleroDataY: String,acceleroDataZ: String,
                        magnetoDataX: String,magnetoDataY: String,magnetoDataZ: String) {
        // Prepare URL
        let url = URL(string: "https://api.thingspeak.com/update?api_key=0R8R3K813KCFV816&field1=\(acceleroDataX)&field2=\(magnetoDataX)&field3=\(acceleroDataY)&field4=\(magnetoDataY)&field5=\(acceleroDataZ)&field6=\(magnetoDataZ)")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "userId=300&title=My urgent task&completed=false"
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8)
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { data, _, error in

            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }

            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
}
