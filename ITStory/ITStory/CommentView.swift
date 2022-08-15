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
    @State var isAlert = false
   // @State var item: BlogPost
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        Text("댓글")
                        ForEach(blog.comments, id: \.self) { comment in
                            VStack {
                                    CommentList(comment: comment)
                            }.padding(3)
                        }//.onDelete(perform: deletePost)
                    }
                    
                    TextField("댓글 내용", text: $commentContent)
                        .padding()
                    Divider()
                    TextField("작성자", text: $commentWriter)
                        .padding()
                    Divider()
                    //Spacer()
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
                print(parameters)
                blog.commentcreate(parameters: parameters)
                blog.fetch()
                
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }) {
            Text("등록")
        }
    }
}
    //struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView()
//    }
//}
