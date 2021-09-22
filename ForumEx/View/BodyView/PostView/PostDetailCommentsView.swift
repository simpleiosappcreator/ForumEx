//
//  PostDetailCommentsView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct PostDetailCommentsView: View {
    @EnvironmentObject var postVM: PostViewModel
    @EnvironmentObject var dataVM: DownloadPostDataViewModel
    let color = Color.color
    
    var body: some View {
        if dataVM.isLoading{
            Spacer()
            ProgressView()
            Spacer()
        }else{
            LazyVStack{
                ForEach(dataVM.data) {comment in
                    VStack(alignment: .leading){
                        HStack{
                            Text("#\(comment.id)")
                                .font(.body)
                                .foregroundColor(.gray.opacity(0.8))
                            Text(comment.name)
                                .font(.body)
                                .foregroundColor(.gray.opacity(0.8))
                        }
                        
                        Text(comment.body)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(color.textImage)
                        
                        Divider()
                            .frame(height: 5)
                    }
                }
            }
        }
    }
}

struct PostDetailCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailCommentsView()
    }
}
