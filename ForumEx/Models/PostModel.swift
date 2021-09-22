//
//  PostModel.swift
//  ForumEx
//
//  Created by HAHA on 21/9/2021.
//

import Foundation

struct PostModel: Identifiable, Decodable{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
