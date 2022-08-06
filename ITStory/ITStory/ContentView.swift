//
//  ContentView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    @State var tag:Int? = nil
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Image("Image")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                    Spacer()
                    Text("IT Story")
                        .padding()
                        .foregroundColor(.black)
                    //                .frame(width: 250, height: 65)
                    //                .background(Color(.systemGray4))
                    Spacer()
                    //            Image(systemName: "magnifyingglass")
                    //                .foregroundColor(.gray)
                    
                    NavigationLink(destination: WritingView(), tag: 1, selection: self.$tag) {}
                    Button(action: {
                        self.tag = 1
                    }) {
                        Image(systemName: "highlighter")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                //        MyTabView()
                //            .navigationBarBackButtonHidden(true)
                //            .navigationBarHidden(true)
                Spacer()
            }
//            .padding(.horizontal)
//            .padding(.vertical)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
