//
//  ContentView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homeNaviBarVM: HomeNaviBarViewModel
    @EnvironmentObject var postVM: PostViewModel
    @EnvironmentObject var slideMenuVM: SlideMenuViewModel
    @EnvironmentObject var customTabBarVM: CustomTabBarViewModel
    let color = Color.color
    
    let screenWidth = UIScreen.main.bounds.width * 0.45
    @State var dragToShowMenuOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
                VStack{
                    AppBarView()
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .background(color.appBarAndFooter)
                    
                    if homeNaviBarVM.currentSelection == "Instant"{
                        ScrollView(.vertical, showsIndicators: false) {
                            BodyView()
                                .padding(.horizontal)
                            
                            FooterView()
                                .padding(.horizontal)
                                .padding(.top)
                                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                                .background(color.appBarAndFooter)
                        }
                    }else{
                        Spacer()
                        
                        Text("Popular Posts")
                        
                        Spacer()
                    }
                }
                .background(color.background.ignoresSafeArea())
            
            ZStack{
                if customTabBarVM.showTabBar{
                    CustomTabBarView()
                        .transition(.move(edge: .bottom))
                        .animation(.default)
                        .padding(.top)
                        .padding(.horizontal)
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        .background(color.appBarAndFooter)
                }
            }
            .zIndex(1.0)
            
            ZStack{
                if postVM.showPostDetail{
                    PostDetailView()
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                        .offset(x: postVM.dragToDisappearXOffset)
                }
            }
            .zIndex(1.0)
            }
            .ignoresSafeArea()
            .onAppear{
                withAnimation{
                    postVM.showPostDetail = false
                }
            }
            .offset(x: slideMenuVM.showSlideMenu == true ? screenWidth : 0)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        withAnimation {
                            if value.translation.width > 5 && !slideMenuVM.showSlideMenu{
                                slideMenuVM.showSlideMenu = true
                            }else if value.translation.width < 0 && slideMenuVM.showSlideMenu{
                                slideMenuVM.showSlideMenu = false
                            }
                        }
                    }
                    .simultaneously(with:
                                        DragGesture()
                                            .onChanged{ value in
                                                withAnimation {
                                                    if value.translation.height < 0{
                                                        customTabBarVM.showTabBar = false
                                                    }else{
                                                        customTabBarVM.showTabBar = true
                                                    }
                                                }
                                            }
                                   )
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
