//
//  CommentList.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/16.
//

import SwiftUI

struct CommentList: View { // 댓글 목록 
    var commentModel: CommentModel.comments
   
    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 6) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.purple)
                    Text(commentModel.commentWriter)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                    Spacer()
                }
                HStack {
                    Text(commentModel.commentContent)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title3.bold())
                        .foregroundColor(.primary)
                    Spacer()
                }
                HStack {
                    Text(commentModel.createDateTime)
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
//
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentList(commentModel: CommentModel.comments(commentId: 0, commentWriter: "jh", commentContent: "good", createDateTime: "3"))
//    }
//}
