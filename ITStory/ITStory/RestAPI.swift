//
//  RestAPI.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/09.
//

import Foundation

struct BlogPost: Hashable, Codable {
    let postId: Int
    let postTitle: String
    let postContent: String
    let createTime: String
}

struct PostModel: Decodable {
    let postId: Int
    let postTitle: String
    let postContent: String
}


class RestApI: ObservableObject{
    @Published var posts: [BlogPost] = []
    
    func fetch() {
        guard let url = URL(string:
            "http://15.164.225.190/api/post/list") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([BlogPost].self, from: data)
                DispatchQueue.main.async {
                    self?.posts = posts
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func creat(parameters: [String: Any]) {
        guard let url = URL(string:
            "http://15.164.225.190/api/post/new") else {
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let posts = try JSONDecoder().decode([BlogPost].self, from: data)
                DispatchQueue.main.async {
                    print(posts)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
