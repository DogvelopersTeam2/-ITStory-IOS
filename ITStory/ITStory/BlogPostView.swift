//
//  BlogPostView.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/07.
//

import SwiftUI

struct BlogPostView: View {
    var blogPost: BlogPosts
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image(blogPost.image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 310)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Text(blogPost.name)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                                .padding(.vertical, 15)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        Text(blogPost.details)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .foregroundColor(Color.primary.opacity(0.9))
                            .padding(.bottom, 25)
                            .frame(maxWidth: .infinity)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BlogPostView_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostView(blogPost: BlogPosts(id: 1, name: "test", image: "1", details: "ddkdkdkdkk"))
    }
}
