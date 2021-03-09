//
//  font.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/9.
//

import Foundation
import SwiftUI

//private extension TextStyle {
//
//}

private extension TextFieldStyle {
    var foregroundColor: Color { .blue }
    var padding: CGFloat { 10 }
    var cornerRadius: CGFloat { 10 }
    var font: Font { Font.body.bold() }
    // .system(.largeTitle)
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
//            .padding(10)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
//            .cornerRadius(20)
//            .shadow(color: .gray, radius: 10)
            .foregroundColor(.blue)
    }
}

//struct MyPrimaryButtonStyle: TextFieldStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .foregroundColor(foregroundColor)
//            .padding(padding)
//            .cornerRadius(cornerRadius)
//            .font(Font.body.bold())
//    }
//}
