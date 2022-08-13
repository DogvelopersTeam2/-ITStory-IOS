//
//  UpdateView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/12.
//

//import SwiftUI
//
//struct UpdateView: View {
//    var body: some View {
//        NavigationView {
//        VStack{
//            // 제목 작성
//            TextField("제목 입력해주세요.", text: $postTitle)
//                .padding()
//                .background(Color(uiColor: .secondarySystemBackground))
//
//            // 내용 작성
//            ZStack {
//                if self.postContent.isEmpty {
//                    TextEditor(text: $placeholder)
//                        .font(.body)
//                        .foregroundColor(.gray)
//                        .disabled(true)
//                        .padding()
//                }
//                TextEditor(text: $postContent)
//                    .font(.body)
//                    .opacity(self.postContent.isEmpty ? 0.25 : 1)
//                    .padding()
//                Spacer()
//            }.padding()
//                .alert(isPresented: $isAlert, content : {
//                    let title = Text("no data")
//                    let message = Text("fill title and post")
//                    return Alert(title: title, message: message)
//                })
//            //                    .onAppear(perform: {
//            //                        self.title = item.title
//            //                        self.content = item.content
//            //                    })
//
//        }
//        .navigationBarTitle("글 작성", displayMode: .inline)
//        .navigationBarItems(trailing: trailing)
//    }
//    .navigationBarHidden(true)
//    .navigationBarBackButtonHidden(true)
//    }
//
//    var trailing: some View {
//        Button(action: {
//            if postTitle != "" && postContent != "" {
//                let parameters: [String: Any] = ["postTitle": postTitle, "postContent": postContent]
//                blog.creat(parameters: parameters)
//                blog.fetch()
//
//                isPresented.toggle()
//            } else {
//                isAlert.toggle()
//            }
//        }) {
//            Text("등록")
//        }
//    }
//
//}
//
//struct UpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateView()
//    }
//}
