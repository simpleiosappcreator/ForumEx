//
//  SlideMenuAppBarView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct SlideMenuAppBarView: View {
    @EnvironmentObject var slideMenuAppBarSearchVM: SlideMenuAppBarSearchViewModel
    var body: some View {
        TextField("🔍 Search...", text: $slideMenuAppBarSearchVM.searchText)
            .textFieldStyle(CustomTextFieldStyle(screenWidthRatio: 0.4, screenHeightRatio: 0.06))
    }
}

struct SlideMenuAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuAppBarView()
    }
}
