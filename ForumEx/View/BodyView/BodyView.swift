//
//  BodyView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct BodyView: View {
    @EnvironmentObject var postVM: PostViewModel
    let color = Color.color
    
    var body: some View {
        LazyVStack{
            ForEach(0..<30){num in
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Publisher\(num) ⏰")
                                    .font(.body)
                                    .foregroundColor(.gray.opacity(0.8))
                                Text(num == 0 ? "now" : "\(num)m")
                                    .font(.body)
                                    .foregroundColor(.gray.opacity(0.8))
                            }
                            
                            Text("This is post \(num)")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(color.textImage)
                        }
                        
                        Spacer()
                    }
                    .onTapGesture {
                        postVM.postTitle = "This is post \(num)"
                        withAnimation{
                            postVM.showPostDetail = true
                        }
                    }
                    
                    Divider()
                        .frame(height: 5)
                }
            }
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
