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
    @State var postTitle: String = ""
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var postContent: String = ""
    let item: PostModel
    
    var body: some View {
        VStack{
            // 제목 작성
            TextField("제목 입력해주세요.", text: $postTitle)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))

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
                })

        }
        .navigationBarTitle("글 수정", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }

    var trailing: some View {
        Button(action: {
            // update post
            if postTitle != "" && postContent != "" {
                let parameters: [String: Any] = ["postId": item.postId,"postTitle": postTitle, "postContent": postContent]
                blog.update(parameters: parameters)
                blog.fetch()
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("저장")
        })
    }

}

//struct UpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateView()
//    }
//}
