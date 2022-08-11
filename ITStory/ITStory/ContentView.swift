//
//  ContentView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    @State var tag:Int? = nil
    @StateObject var blog = RestApI()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    //                        Image("Image")
                    //                            .resizable()
                    //                            .frame(width: 40, height: 40)
                    //                            .padding()
                    NavigationLink(destination: WritingView(), tag: 1, selection: self.$tag) {}
                    Button(action: {
                        self.tag = 1
                    }) {
                        Image(systemName: "highlighter")
                            .foregroundColor(.purple)
                            .padding()
                    }
                }
                List {
                    ForEach(blog.posts, id: \.self) { post in
                        VStack {
//                            HStack {
//                            Text(post.postTitle)
//                                .font(.system(size: 20))
//                                .bold()
//                            }.padding(3)
//
//                            Text(post.postContent)
//                                .font(.system(size: 15))
//                                .bold()
                            
                            NavigationLink(destination: BlogPostView(blogPost: post)) {
                                BlogPostCardList(blogPost: post)
                            }
                            
                        }.padding(3)
                    }
                }.listStyle(InsetListStyle())
                .navigationTitle("IT Story")
                .onAppear {
                    blog.fetch()
                }
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
