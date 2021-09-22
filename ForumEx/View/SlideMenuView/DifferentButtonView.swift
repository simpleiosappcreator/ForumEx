//
//  DifferentButtonView.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct DifferentButtonView: View {
    @EnvironmentObject var slideMenuVM: SlideMenuViewModel
    let buttonImages: [String] = ["mic.fill", "moon.fill", "folder.fill", "keyboard", "gamecontroller.fill", "icloud.fill", "car.fill", "flame.fill"]
    
    let hSpacing = UIScreen.main.bounds.width * 0.3 - 20 - 2 * UIScreen.main.bounds.width * 0.05
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible(minimum: UIScreen.main.bounds.width * 0.1), spacing: hSpacing), GridItem(.flexible(minimum: UIScreen.main.bounds.width * 0.1))], spacing: hSpacing) {
            ForEach(buttonImages, id: \.self){image in
                Image(systemName: image)
                    .resizable()
                    .frame(height: UIScreen.main.bounds.width * 0.1)
                    .onTapGesture {
                        print("Do sth")
                    }
            }
        }
    }
}

struct DifferentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DifferentButtonView()
    }
}
