//
//  CustomViewModifier.swift
//  ZQCustomStyle
//
//  Created by ZhiQiang wei on 2021/3/9.
//

import Foundation
import SwiftUI

/*
 类似语句：
    .modifier(ZQRegularFont(fontSize: 13))
 
 例子一：
    Text("Default").modifier(ZQRegularFont(fontSize: 13))

 例子二：
    TextField("Search...", text: $text).modifier(ZQRegularFont(fontSize: 16))
 */
struct ZQRegularFont: ViewModifier {
    var fontSize:CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundColor(.green) //#333333
            .font(.custom("PingFangSC-Regular", size: fontSize))
    }
}

struct ZQMediumFont: ViewModifier {
    var fontSize:CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue) //#333333
            .font(.custom("PingFangSC-Medium", size: fontSize))
    }
}

struct ZQSemiboldFont: ViewModifier {
    var fontSize:CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red) //TODO #333333
            .font(.custom("PingFangSC-Semibold", size: fontSize))
    }
}
