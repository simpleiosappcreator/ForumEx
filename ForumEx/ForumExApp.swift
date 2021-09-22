//
//  ForumExApp.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

@main
struct ForumExApp: App {
    @StateObject var dataVM: DownloadPostDataViewModel = DownloadPostDataViewModel()
    @StateObject var postVM: PostViewModel = PostViewModel()
    @StateObject var homeNaviBarVM: HomeNaviBarViewModel = HomeNaviBarViewModel()
    @StateObject var postNaviBarVM: PostAppBarViewModel = PostAppBarViewModel()
    @StateObject var slideMenuVM: SlideMenuViewModel = SlideMenuViewModel()
    @StateObject var slideMenuAppBarSearchVM: SlideMenuAppBarSearchViewModel = SlideMenuAppBarSearchViewModel()
    @StateObject var customTabBarVM: CustomTabBarViewModel = CustomTabBarViewModel()
    
    var body: some Scene {
        WindowGroup {
            BackgroundMenuAndContentView()
                .environmentObject(dataVM)
                .environmentObject(postVM)
                .environmentObject(homeNaviBarVM)
                .environmentObject(postNaviBarVM)
                .environmentObject(slideMenuVM)
                .environmentObject(slideMenuAppBarSearchVM)
                .environmentObject(customTabBarVM)
        }
    }
}
