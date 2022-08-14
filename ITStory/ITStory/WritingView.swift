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
    //@State var tag:Int? = nil
    @Binding var postTitle: String
    @Binding var postContent: String 
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var isAlert = false
    //let item: PostModel
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                
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
                    .alert(isPresented: $isAlert, content : {
                        let title = Text("no data")
                        let message = Text("fill title and post")
                        return Alert(title: title, message: message)
                    })
            }
            .navigationBarTitle("글 작성", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text("취소")
        }
    }
    
    var trailing: some View {
        Button(action: {
            if postTitle != "" && postContent != "" {
                let parameters: [String: Any] = ["postTitle": postTitle, "postContent": postContent]
                blog.creat(parameters: parameters)
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

//struct WritingView_Previews: PreviewProvider {
//    static var previews: some View {
//        WritingView()
//    }
//}
