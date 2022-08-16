//
//  ContentView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var blog = RestApI()
    @State var isPresentedNewPost = false
    @State var postCategory: String = ""
    @State var postTitle: String = ""
    @State var postContent: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(blog.posts, id: \.self) { post in
                        VStack {
//                            NavigationLink(destination: BlogPostView(blogPost: post)) {
//                                BlogPostCardList(blogPost: post)
//                            }
                            
                            // item: updateview에 있는 item
                            // post: posts에 있는 각각의 제목, 내용 등을 의미
                            NavigationLink(destination: UpdateView(item: post)) {
                                BlogPostCardList(blogPost: post)
                            }
                        }.padding(3)
                    }.onDelete(perform: deletePost) // 삭제 
                }.listStyle(InsetListStyle())
                .navigationTitle("IT Story")
                .navigationBarItems(trailing: writeButton)
                .onAppear {
                    blog.fetch() // 전체 글 조회
                }
            } // 글 작성하는 뷰 sheet로 보여줌
            .sheet(isPresented: $isPresentedNewPost, content: {
                WritingView(isPresented: $isPresentedNewPost, postCategory: $postCategory, postTitle: $postTitle, postContent: $postContent)
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    // 글 삭제하는 함수 
    private func deletePost(at offsets: IndexSet) {
        let postId = offsets.map { blog.posts[$0].postId }
        DispatchQueue.main.async {
            let parameters: [String: Int] = ["postId": postId[0]]
            self.blog.delete(parameters: parameters)
            self.blog.fetch()
        }
    }
    
    // 글 쓰기 버튼
    var writeButton: some View {
        Button(action: {
            isPresentedNewPost.toggle()
        }) {
            Image(systemName: "highlighter")
                .foregroundColor(.purple)
                .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
