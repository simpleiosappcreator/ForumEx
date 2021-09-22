//
//  FooterView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct FooterView: View {
    let color = Color.color
    
    var body: some View {
        HStack{
            Spacer()
            
            VStack{
                Text("No more posts here...")
                    .fontWeight(.semibold)
                
                Label("Tap here to refresh!", systemImage: "arrow.clockwise.circle.fill")
                    
            }
            .font(.title2)
            .foregroundColor(Color.white)
            
            Spacer()
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
