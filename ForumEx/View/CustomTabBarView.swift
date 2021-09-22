//
//  CustomTabBarView.swift
//  ForumEx
//
//  Created by HAHA on 23/9/2021.
//

import SwiftUI

struct CustomTabBarView: View {
    @EnvironmentObject var customTabBarVM: CustomTabBarViewModel
    @EnvironmentObject var slideMenuVM: SlideMenuViewModel
    let color = Color.color
    
    var body: some View {
        HStack{
            Button {
                withAnimation {
                    slideMenuVM.showSlideMenu.toggle()
                }
            } label: {
                Image(systemName: "list.bullet")
            }
            .withCustomButtonStyle()
            
            Spacer()
            
            Button {
                print("Add sth")
            } label: {
                Image(systemName: "plus.app.fill")
            }
            .withCustomButtonStyle()
            
            Spacer()
            
            Button {
                print("Refresh post")
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
            }
            .withCustomButtonStyle()
        }
        .font(.title)
        .foregroundColor(color.textImage)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
