//
//  PostViewModel.swift
//  ForumEx
//
//  Created by HAHA on 21/9/2021.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject{
    @Published var postTitle: String = ""
    @Published var showPostDetail: Bool = false
    @Published var dragToDisappearXOffset: CGFloat = 0
}
