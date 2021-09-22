//
//  SlideMenuView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct SlideMenuView: View {
    let color = Color.color
    var body: some View {
        ZStack{
            VStack{
                SlideMenuAppBarView()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom)
                    .padding(.horizontal)
                
                DifferentButtonView()
                
                Spacer()
            }
            .padding(.horizontal)
            .background(color.appBarAndFooter.ignoresSafeArea())
        }
        .padding(.horizontal)
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width * 0.45)
        .frame(maxHeight: .infinity)
    }
}

struct SlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuView()
    }
}
