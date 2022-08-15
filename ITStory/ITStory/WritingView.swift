//
//  WritingView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct WritingView: View {
    @StateObject var blog = RestApI()
    @Binding var isPresented: Bool
    @Binding var postCategory: String
    @Binding var postTitle: String
    @Binding var postContent: String 
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                // 카테고리 작성
                TextField("카테고리", text: $postCategory)
                    .textInputAutocapitalization(.characters) // 자동으로 대문자 입력 
                    .padding()
                Divider()
                
                // 제목 작성
                TextField("제목", text: $postTitle)
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
                    .alert(isPresented: $isAlert, content : {
                        let title = Text("제목과 내용을 입력해주세요.")
                        let message = Text("간단해도 좋아요.")
                        return Alert(title: title, message: message)
                    })
            }
            .navigationBarTitle("글 작성", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
            if postCategory != "" && postTitle != "" && postContent != "" {
                let parameters: [String: Any] = ["postCategory": postCategory, "postTitle": postTitle, "postContent": postContent]
                blog.create(parameters: parameters) // 데이터 보내는 api
                blog.fetch() // 데이터 받는 api
                
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }) {
            Text("등록")
        }
    }
    
    
}

//struct WritingView_Previews: PreviewProvider {
//    static var previews: some View {
//        WritingView()
//    }
//}
