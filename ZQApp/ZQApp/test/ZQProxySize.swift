//
//  ZQContent.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/23.
//

import SwiftUI

struct OrangeColor : View {
    var body: some View {
        return GeometryReader { proxy in
//            let rect = .zero  //当前版本 SwiftUI 的 GeometryReader closure 参数里，貌似不允许存在多条语句
            return Rectangle()
                .fill(Color.blue)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}


struct ZQContent: View {
    var body: some View {
        Text("Hello.world")
            .padding(20)
            .background(OrangeColor())
    }
}

struct ZQContent_Previews: PreviewProvider {
    static var previews: some View {
        ZQContent()
    }
}
