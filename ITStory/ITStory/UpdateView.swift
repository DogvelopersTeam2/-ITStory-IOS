//
//  UpdateView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/12.
//

import SwiftUI

struct UpdateView: View {
    @StateObject var blog = RestApI()
    @Environment(\.presentationMode) var presentationMode
    @State var isPresentedNewPost = false
    @State var postCategory: String = ""
    @State var postTitle: String = ""
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var postContent: String = ""
    
    @State var postId: Int = 0
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
                .onAppear(perform: {
                    self.postTitle = item.postTitle
                    self.postContent = item.postContent
                    self.postId = item.postId
                })

            HStack {
                Spacer()
                Text(item.createTime)
                    .foregroundColor(.gray)
                //Spacer()
                commentButton // 댓글 쓰는 뷰로 넘어감 
            }
            
            List {
                ForEach(blog.comments, id: \.self) { comment in
                    VStack {
                        NavigationLink(destination: UpdateView(item: item)) {
                            CommentList(comment: comment)
                        }
                        
                    }.padding(3)
                }
                //.onDelete(perform: deletePost)
            }.listStyle(InsetListStyle())
            //.navigationTitle("IT Story")
           // .navigationBarItems(trailing: writeButton)
            .onAppear {
                //blog.commentfetch(parameters: item.postId)
                self.postId = item.postId
                
            }
            
//            Text(citem.commentContent)
//            Text(citem.commentWriter)
//            Text(citem.createDateTime)
            
        }.sheet(isPresented: $isPresentedNewPost, content: {
            CommentView(isPresented: $isPresentedNewPost, commentContent: $commentContent, commentWriter: $commentWriter, postId: $postId)
        })
        .navigationBarTitle("글 수정", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }

    // 저장 버튼 
    var trailing: some View {
        Button(action: {
            // update post
            if postTitle != "" && postContent != "" {
                let parameters: [String: Any] = ["postId": item.postId, "postTitle": postTitle, "postContent": postContent]
                blog.update(parameters: parameters)
                blog.fetch()
                presentationMode.wrappedValue.dismiss()
                
                //print(item)
                //print(citem)
            }
        }, label: {
            Text("저장")
        })
    }

    // 댓글 쓰는 뷰로 넘어감
    var commentButton: some View {
        Button(action: {
            isPresentedNewPost.toggle()
            let parameters: [String: Any] = ["postId": item.postId, "postTitle": postTitle, "postContent": postContent]
            blog.commentfetch(parameters: parameters)
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
