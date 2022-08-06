//
//  WritingView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct WritingView: View {
    @State var tag:Int? = nil
    @State var placeholder: String = "개발 내용을 작성해주세요."
    @State var content: String = ""
    
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
//                    Text("취소")
//                        .padding()
//                    Text("카테고리")
//                        .padding()
                    Text("등록")
                        .padding()
                }
                Spacer()
                
                // 텍스트 작성
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
                }
                
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
