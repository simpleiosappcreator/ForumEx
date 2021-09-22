//
//  PostDetailView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct PostDetailView: View {
    @EnvironmentObject var postVM: PostViewModel
    @EnvironmentObject var postNaviBarVM: PostAppBarViewModel
    @State var dragPostYOffset: CGFloat = 0
    let color = Color.color
    
    var body: some View {
        ZStack{
            VStack{
                PostDetailAppBarView()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.horizontal)
                    .padding(.bottom, postNaviBarVM.scaleDownAppBar == true ? -10 : 10)
                    .background(color.appBarAndFooter)
                
                ScrollView(.vertical, showsIndicators: false) {
                    PostDetailCommentsView()
                        .padding(.horizontal)
                    
                    PostDetailFooterView()
                        .padding(.top)
                        .padding(.horizontal)
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        .background(color.appBarAndFooter)
                }
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation{
                                if value.translation.height < 0{
                                    postNaviBarVM.scaleDownAppBar = true
                                }else{
                                    postNaviBarVM.scaleDownAppBar = false
                                }
                            }
                        }
                        .simultaneously(with:
                                            DragGesture()
                                                .onChanged{ value in
                                                    if value.translation.width > 0{
                                                        postVM.dragToDisappearXOffset = value.translation.width
                                                    }
                                                }
                                                .onEnded{ value in
                                                    withAnimation{
                                                        if value.translation.width >= UIScreen.main.bounds.width * 0.35{
                                                            postVM.showPostDetail = false
                                                        }
                                                        postVM.dragToDisappearXOffset = 0
                                                    }
                                                }
                                       )
                )
            }
            .background(color.background.ignoresSafeArea())
        }
        .ignoresSafeArea()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
