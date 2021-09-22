//
//  CustomTextFieldStyle.swift
//  UIDesignTest
//
//  Created by HAHA on 19/9/2021.
//

import SwiftUI

struct CustomTextFieldStyle : TextFieldStyle {
    let screenWidth = UIScreen.main.bounds.width
    let screenWidthRatio: Double
    let screenHeigh = UIScreen.main.bounds.height
    let screenHeightRatio: Double
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.title) // set the inner Text Field Font
            .padding(10) // Set the inner Text Field Padding
            //Give it some style
            .frame(width: screenWidth * CGFloat(screenWidthRatio), height: screenHeigh * CGFloat(screenHeightRatio))
            .background(Color.gray.opacity(0.2).cornerRadius(10))
    }
}
