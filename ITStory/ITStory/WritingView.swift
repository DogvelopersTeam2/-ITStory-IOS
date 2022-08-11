//
//  WritingView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct WritingView: View {
    @State var tag:Int? = nil
    @State var title: String = ""
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var content: String = ""
    //let item: PostModel
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    
                    // 버튼으로 바꾸기
                    NavigationLink(destination: ContentView(), tag: 2, selection: self.$tag) {}
                    Button(action: {
                        self.tag = 2
                    }) {
                    Text("취소")
                        .foregroundColor(Color.black)
                        .padding()
                    }
                    // 버튼으로 바꾸고 이걸 누르면 서버 요청하고 디비에 저장
                    Text("등록")
                        .padding()
                }
                Spacer()
                
                // 제목 작성
                TextField("제목 입력해주세요.", text: $title)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                
                // 내용 작성
                ZStack {
                    if self.content.isEmpty {
                        TextEditor(text: $placeholder)
                            .font(.body)
                            .foregroundColor(.gray)
                            .disabled(true)
                            .padding()
                    }
                    TextEditor(text: $content)
                        .font(.body)
                        .opacity(self.content.isEmpty ? 0.25 : 1)
                        .padding()
                    Spacer()
                }.padding()
//                    .onAppear(perform: {
//                        self.title = item.title
//                        self.content = item.content
//                    })
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView()
    }
}
