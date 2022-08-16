//
//  BlogPostCardList.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/07.
//

import SwiftUI

struct BlogPostCardList: View { // 글 목록 보여주는 뷰
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 6) {
                HStack {
                    Text("[" + blogPost.postCategory + "]")
                        .font(.subheadline)
                        .foregroundColor(.purple)
                    Spacer()
                }
                HStack {
                    Text(blogPost.postTitle)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.primary)
                    Spacer()
                }
                HStack {
                    Text(blogPost.postContent)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                HStack {
                    Text(blogPost.createTime)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String("댓글: \(blogPost.commentCount)"))
                        .foregroundColor(.purple)
                        .font(.subheadline)
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 60, alignment: .leading)
        .padding()
    }
}

struct BlogPostCardList_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostCardList(blogPost: BlogPost(postId: 0,postCategory: "IOS", postTitle: "testtt", postContent: "ttt", commentCount: 0, createTime: "da"))
    }
}
