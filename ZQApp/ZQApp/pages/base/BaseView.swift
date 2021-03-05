//
//  BaseView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//
//参考文章：
//文章一：https://www.debugcn.com/article/53269272.html
//文章二：https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/

import SwiftUI
protocol BaseView : View {
    associatedtype LoadedBody: View
    associatedtype UnloadedBody: View

    func contentLoaded() -> Bool
    
    var loadedBody: LoadedBody { get }
    
    var unloadedBody: UnloadedBody { get }
}

extension BaseView {
    @ViewBuilder
    var body: some View {
        if contentLoaded() {
            self.loadedBody
        } else {
            self.unloadedBody
        }
    }
}
