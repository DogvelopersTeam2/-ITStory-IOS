//
//  CommentView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/15.
//

import SwiftUI

struct CommentView: View {
    @StateObject var blog = RestApI()
    @Binding var isPresented: Bool
    @Binding var commentContent: String
    @Binding var commentWriter: String
    @Binding var postId: Int
    @Binding var commentId: Int
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List { // 댓글 보여주기
                        ForEach(blog.comments, id: \.self) { comment in
                            VStack {
                                CommentList(commentModel: comment)
                            }.padding(3)
                        }.onDelete(perform: deleteComment)
                    }
                    .onAppear(perform: {
                        let parameter: [String: Any] = ["postId": postId]
                        blog.commentfetch(parameters: parameter)
                       // self.commentId = commentId
                        self.commentContent = commentContent
                        self.commentWriter = commentWriter
                    })
                    
                    TextField("작성자", text: $commentWriter)
                        .padding()
                    Divider()
                        TextField("댓글 내용", text: $commentContent)
                        .padding()
                    Divider()
                }
            }
            .alert(isPresented: $isAlert, content : {
                let title = Text("댓글 작성해주세요.")
                let message = Text("간단해도 좋아요.")
                return Alert(title: title, message: message)
            })
            .navigationBarTitle("댓글", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    // 취소 버튼
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text("취소")
        }
    }
    
    // 등록 버튼 
    var trailing: some View {
        Button(action: {
            if commentContent != "" && commentWriter != ""{
                let parameters: [String: Any] = ["postId": postId, "commentContent": commentContent, "commentWriter": commentWriter]
                blog.commentcreate(parameters: parameters)
                blog.commentfetch(parameters: parameters)
                isPresented.toggle()
                
                // api로 보냈으니까 썼던 거 지우기
                commentWriter = ""
                commentContent = ""
            } else {
                isAlert.toggle()
            }
        }) {
            Text("등록")
        }
    }
    
    // 댓글 삭제
    private func deleteComment(at offsets: IndexSet) {
        //let postId = offsets.map { blog.posts[$0].postId }
        let commentId = offsets.map { blog.comments[$0].commentId }
        DispatchQueue.main.async {
            let parameters: [String: Int] = ["postId": postId, "commentId": commentId[0]]
            self.blog.commentdelete(parameters: parameters)
            self.blog.commentfetch(parameters: parameters)
        }
    }
}
    //struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView()
//    }
//}
