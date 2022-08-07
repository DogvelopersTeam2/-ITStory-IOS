//
//  BlogPosts.swift
//  ITStory
//
//  Created by Jinhee on 2022/08/06.
//

import Foundation

struct BlogPosts : Identifiable {
    
    var id : Int
    var name: String
    var image: String
    var details : String
}

var latestpost = [
    
    BlogPosts(id: 0, name: "park", image: "1", details: "떡볶이, 마라탕, 훠궈, 항정살, 냉면, 소바, 초밥, 감튀, 불닭, 짜장면, 볶음밥, 타코, 칼국수, 잔치국수, 물회, 회, 생선, 족발, 보쌈, 치킨, 피자, 아이스크림, 빵, 커피, 딸기, 체리, 사과, 배, 복숭아")
]

var featuredpost = [

    BlogPosts(id: 0, name: "lee", image: "1", details: "안녕하녕ㅇ아녕아어아ㅓ아아아ㅏ아ㅏ아아아아아아ㅏ아ㅏ아아아")
]
