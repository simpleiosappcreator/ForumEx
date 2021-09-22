//
//  PostDetailFooterView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct PostDetailFooterView: View {
    var body: some View {
        HStack{
            Spacer()
            
            VStack{
                Text("No more comments here...")
                    .fontWeight(.semibold)
                
                Label("Tap here to refresh!", systemImage: "arrow.clockwise.circle.fill")
                    
            }
            .font(.title2)
            .foregroundColor(Color.white)
            
            Spacer()
        }
    }
}

struct PostDetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailFooterView()
    }
}
