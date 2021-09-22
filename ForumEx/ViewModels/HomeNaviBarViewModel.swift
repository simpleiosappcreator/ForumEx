//
//  HomeNaviBarViewModel.swift
//  ForumEx
//
//  Created by HAHA on 21/9/2021.
//

import Foundation

class HomeNaviBarViewModel: ObservableObject{
    let titles: [String] = ["Instant", "Popular"]
    @Published var currentSelection: String = "Instant"
}
