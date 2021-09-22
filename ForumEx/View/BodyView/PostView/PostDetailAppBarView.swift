//
//  PostDetailAppBarView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct PostDetailAppBarView: View {
    @EnvironmentObject var postVM: PostViewModel
    @EnvironmentObject var postNaviBarVM: PostAppBarViewModel
    let color = Color.color
    
    var body: some View {
        HStack{
            Button {
                withAnimation{
                    postVM.showPostDetail = false
                }
            } label: {
                Image(systemName: "arrowshape.turn.up.left.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .withCustomButtonStyle()
            .opacity(postNaviBarVM.scaleDownAppBar == true ? 0 : 1.0)
            
            Spacer()
            
            Text(postVM.postTitle)
                .font(postNaviBarVM.scaleDownAppBar == true ? .system(size: 10) : .title2)
                .offset(y: postNaviBarVM.scaleDownAppBar == true ? -10 : 0)
                .foregroundColor(.white)
            
            Spacer()

        }
    }
}

struct PostDetailAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailAppBarView()
    }
}
