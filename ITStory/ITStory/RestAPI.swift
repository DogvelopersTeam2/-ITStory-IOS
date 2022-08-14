//
//  RestAPI.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/09.
//

import Foundation

struct BlogPost: Hashable, Codable { // 데이터 받기
    
//    init(postId: Int = 0, postTitle: String = "", postContent: String = "", commentCount: Int = 0, createTime: String = "") {
//        self.postId = postId
//        self.postTitle = postTitle
//        self.postContent = postContent
//        self.commentCount = commentCount
//        self.createTime = createTime
//    }
//
//        var postId: Int
//        var postTitle: String
//        var postContent: String
//        var commentCount: Int
//        var createTime: String
    
    
    let postId: Int
    let postTitle: String
    let postContent: String
    let commentCount: Int
    let createTime: String
}

struct PostModel: Decodable { // 데이터 보내기
    let postId: Int
    let postTitle: String
    let postContent: String
    let commentCount: Int
    let createTime: String
}


struct CommentModel : Hashable, Codable {
    let commentId: String
    let commentWriter: String
    let commentContent: String
    let createDateTime: String
}


class RestApI: ObservableObject{
    @Published var posts: [BlogPost] = []
    @Published var comments: [CommentModel] = []
    var postId = BlogPost.self
    
    //MARK: - 데이터 받기
    func fetch() {
        guard let url = URL(string:
            "http://15.164.225.190/post/list") else {
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
    
    //MARK: - 데이터 보내기
    func creat(parameters: [String: Any]) {
        guard let url = URL(string:
            "http://15.164.225.190/post") else {
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
    
    //MARK: - 데이터 수정
    func update(parameters: [String: Any]) {
        
        guard let url = URL(string:
            "http://15.164.225.190/post/\(postId)") else {
            print("error")
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
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
    
    //MARK: - 데이터 삭제
    func delete(parameters: [String: Any]) {
        
        guard let url = URL(string:
            "http://15.164.225.190/post/\(postId)") else {
            print("error")
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
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
    
    
    //MARK: - 댓글
    func commentfetch() {
        guard let url = URL(string:
            "http://15.164.225.190/post/54/comment") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let comments = try JSONDecoder().decode([CommentModel].self, from: data)
                DispatchQueue.main.async {
                    self?.comments = comments
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
