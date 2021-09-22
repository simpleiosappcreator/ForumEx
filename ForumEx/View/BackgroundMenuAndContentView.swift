//
//  BackgroundMenuView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct BackgroundMenuAndContentView: View {
    let color = Color.color
    
    var body: some View {
        ZStack(alignment: .leading){
            SlideMenuView()
            
            ContentView()
                .zIndex(1.0)
        }
    }
}

struct BackgroundMenuAndContentView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMenuAndContentView()
    }
}
