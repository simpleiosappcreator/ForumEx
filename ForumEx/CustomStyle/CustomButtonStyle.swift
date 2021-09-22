//
//  CustomButtonStyle.swift
//  UIDesignTest
//
//  Created by HAHA on 19/9/2021.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle{
    let opacityValue: Double
    let scale: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? opacityValue : 1.0)
            .scaleEffect(configuration.isPressed ? scale : 1.0)
    }
}

extension View{
    func withCustomButtonStyle(opacityValue: Double = 0.8, scale: CGFloat = 1.2) -> some View{
        buttonStyle(CustomButtonStyle(opacityValue: opacityValue, scale: scale))
    }
}
