//
//  ColorExtension.swift
//  ForumEx
//
//  Created by HAHA on 22/9/2021.
//

import SwiftUI

struct ColorExtension{
    let background = Color("background")
    let appBarAndFooter = Color("appBarAndFooter")
    let textImage = Color("textImage")
}

extension Color{
    static let color = ColorExtension()
}
