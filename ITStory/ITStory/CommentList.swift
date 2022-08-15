//
//  CommentList.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/16.
//

import SwiftUI

struct CommentList: View {
    var comment: CommentModel
   
    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 6) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.purple)
                    Text(comment.commentWriter)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                    Spacer()
                }
                HStack {
                    Text(comment.commentContent)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.primary)
                    Spacer()
                }
                HStack {
                    Text(comment.createDateTime)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 60, alignment: .leading)
        .padding()
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        CommentList(comment: CommentModel(commentId: 0, commentWriter: "jh", commentContent: "good", createDateTime: "3", commentCount: 4, createTime: "5", postContent: "6", postId: 7, postTitle: "8", postCategory: "IOS"))
    }
}
