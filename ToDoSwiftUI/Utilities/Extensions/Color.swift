//
//  Color.swift
//  ToDoSwiftUI
//
//  Created by thaxz on 05/10/23.
//

import Foundation
import SwiftUI

/// Extension to define custom colors for the app.
extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let background = Color("BgColor")
    let customGray = Color("CustomGrayColor")
    let date = Color("DateColor")
    let simpleText = Color("SimpleTextColor")
    let title = Color("TitleColor")
}
