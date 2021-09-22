//
//  AppBarView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct AppBarView: View {
    @EnvironmentObject var homeNaviBarVM: HomeNaviBarViewModel
    let color = Color.color
    @Namespace var namespace
    
    var body: some View {
        HStack{
            ForEach(homeNaviBarVM.titles, id: \.self) {title in
                ZStack{
                    if title == homeNaviBarVM.currentSelection{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow.opacity(0.8))
                            .frame(maxWidth: .infinity)
                            .frame(height: 2)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "titles", in: namespace)
                    }
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation{
                        homeNaviBarVM.currentSelection = title
                    }
                }
            }
        }
    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView()
    }
}
