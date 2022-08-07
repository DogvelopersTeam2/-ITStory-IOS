//
//  AllPosts.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/07.
//

import SwiftUI

struct AllPosts: View { // 이게 홈 
    var body: some View {
        List {
            ForEach(latestpost) { post in
                //Text(post.name)
                NavigationLink(destination: BlogPostView(blogPost: post)) {
                    BlogPostCardList(blogPost : post)
                }
            }
        }
        .listStyle(InsetListStyle())
    }
}

struct AllPosts_Previews: PreviewProvider {
    static var previews: some View {
        AllPosts()
    }
}
