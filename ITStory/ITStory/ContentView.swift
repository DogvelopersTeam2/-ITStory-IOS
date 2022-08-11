//
//  ContentView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    //@State var tag:Int? = nil
    @StateObject var blog = RestApI()
    @State var isPresentedNewPost = false
    @State var postTitle: String = ""
    @State var postContent: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    //                        Image("Image")
                    //                            .resizable()
                    //                            .frame(width: 40, height: 40)
                    //                            .padding()
//                    NavigationLink(destination: WritingView(), tag: 1, selection: self.$tag) {}
//                    Button(action: {
//                        self.tag = 1
//                    }) {
//                        Image(systemName: "highlighter")
//                            .foregroundColor(.purple)
//                            .padding()
//                    }
                }
                List {
                    ForEach(blog.posts, id: \.self) { post in
                        VStack {
                            NavigationLink(destination: BlogPostView(blogPost: post)) {
                                BlogPostCardList(blogPost: post)
                            }
                            
//                            NavigationLink(destination: BlogPostView(blogPost: post),
//                                           label: {
//                                VStack(alignment: .leading) {
//                                    Text(post.postTitle)
//                                    Text(post.postContent)
//                                }
//                            })
                            
                        }.padding(3)
                    }
                }.listStyle(InsetListStyle())
                .navigationTitle("IT Story")
                .navigationBarItems(trailing: writeButton)
                .onAppear {
                    blog.fetch()
                }
            }
            .sheet(isPresented: $isPresentedNewPost, content: {
                WritingView(isPresented: $isPresentedNewPost, postTitle: $postTitle, postContent: $postContent)
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
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
