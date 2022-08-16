//
//  UpdateView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/12.
//

import SwiftUI

struct UpdateView: View {
    @StateObject var blog = RestApI()
    @Environment(\.presentationMode) var presentationMode // sheet 닫히게 하는 방법
    @State var isPresentedNewPost = false
    @State var postCategory: String = ""
    @State var postTitle: String = ""
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var postContent: String = ""
    
    @State var postId: Int = 0
    @State var commentId: Int = 0
    @State var commentContent: String = ""
    @State var commentWriter: String = ""
    let item: BlogPost
    
    var body: some View {
        VStack{
            Spacer()
            // 제목 작성
            TextField("제목", text: $postTitle)
                .font(Font.title3.bold())
                .minimumScaleFactor(0.5) // 프레임에 맞게 글씨 크기 조절
                .lineLimit(3)
                .padding()
            Divider()
            // 내용 작성
            ZStack {
                if self.postContent.isEmpty {
                    TextEditor(text: $placeholder)
                        .font(.body)
                        .foregroundColor(.gray)
                        .disabled(true)
                        .padding()
                }
                TextEditor(text: $postContent)
                    .font(.body)
                    .opacity(self.postContent.isEmpty ? 0.25 : 1)
                    .padding()
                Spacer()
            }.padding()
                .onAppear(perform: { // 해당 post의 제목, 글, id를 알 수 있음
                    self.postTitle = item.postTitle
                    self.postContent = item.postContent
                    self.postId = item.postId
                    
                })

            HStack {
                Spacer()
                Text(item.createTime)
                    .foregroundColor(.gray)
                
                commentButton // 댓글 쓰는 뷰로 넘어감 
            }
        }.sheet(isPresented: $isPresentedNewPost, content: {
            CommentView(isPresented: $isPresentedNewPost, commentContent: $commentContent, commentWriter: $commentWriter, postId: $postId, commentId: $commentId)
        })
        .navigationBarTitle("글 수정", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }

    // 저장 버튼 
    var trailing: some View {
        Button(action: {
            // 글 수정하기
            if postTitle != "" && postContent != "" {
                let parameters: [String: Any] = ["postId": item.postId, "postTitle": postTitle, "postContent": postContent]
                blog.update(parameters: parameters)
                blog.fetch()
                presentationMode.wrappedValue.dismiss() // sheet에 텍스트를 눌러 닫히게 함
            }
        }, label: {
            Text("저장")
        })
    }

    // 댓글 쓰는 뷰로 넘어감
    var commentButton: some View {
        Button(action: {
            isPresentedNewPost.toggle()
            // 해당 글의 postid를 넘겨줌
            if postTitle != "" && postContent != "" {
                let parameters: [String: Any] = ["postId": item.postId, "postTitle": postTitle, "postContent": postContent]
                blog.commentfetch(parameters: parameters)
                
            }
        }) {
            Image(systemName: "paperplane.fill")
                .foregroundColor(.purple)
                .padding()
        }
    }
    
}

//struct UpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateView()
//    }
//}
