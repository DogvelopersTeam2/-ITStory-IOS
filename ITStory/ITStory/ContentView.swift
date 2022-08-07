//
//  ContentView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    @State var tag:Int? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack {
                        Image("Image")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                        Spacer()
                        Text("IT Story")
                            .padding()
                            .foregroundColor(.black)
                        //                .frame(width: 250, height: 65)
                        //                .background(Color(.systemGray4))
                        Spacer()
                        //            Image(systemName: "magnifyingglass")
                        //                .foregroundColor(.gray)
                        
                        NavigationLink(destination: WritingView(), tag: 1, selection: self.$tag) {}
                        Button(action: {
                            self.tag = 1
                        }) {
                            Image(systemName: "highlighter")
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    //        MyTabView()
                    //            .navigationBarBackButtonHidden(true)
                    //            .navigationBarHidden(true)
                    
                    // 블로그 형식 에시
                    LazyVStack {
                        ForEach(featuredpost) { post in
                            //Text(post.name)
                            NavigationLink(destination: BlogPostView(blogPost: post)) {
                                BlogPostCardMain(blogPost: post)
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                }
                //            .padding(.horizontal)
                //            .padding(.vertical)
                
                // latest 지난거
                VStack {
                    HStack {
                        Text("latest posts")
                            .font(.title.bold())
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
//                            ForEach(latestpost) { post in
//                                BlogPostCardMain(blogPost: post)
//                            }
                            
                            if latestpost.count >= 3 {
                                ForEach(latestpost[0...2]) { post in
                                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                                        BlogPostCardMain(blogPost: post)
                                    }
                                }
                            }
                            else {
                                ForEach(latestpost[0..<latestpost.count]) { post in
                                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                                        BlogPostCardMain(blogPost: post)
                                    }
                                }
                            }
                            
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 30)
                    }
                    .frame(height: 420)
                    Spacer()
                }
                .padding(.bottom, 40)
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
