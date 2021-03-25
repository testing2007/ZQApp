//
//  ZQAsyncContentView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/5.
//

import Foundation
import SwiftUI
import Combine

struct ZQAsyncContentView<Source:ZQLoadableObject, LoadingView:View, Content:View> : View {
    @ObservedObject var source:Source
    var loadingView:LoadingView
    var content:(Source.Output) -> Content
    
    init(source:Source,
         loadingView:LoadingView,
         @ViewBuilder content: @escaping (Source.Output) -> Content) {
        self.source = source
        self.loadingView = loadingView
        self.content = content
    }
    
    var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
//            ProgressView()
            loadingView //TODO: 即便 loadingView 不设置，下拉刷新会出现空白页
        case .failed(let error):
//            Text("ZQErrorView")
            ZQErrorView(error:error, retryHandler: source.load)
        case .loaded(let output):
            content(output)
        }
    }
}

typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>
extension ZQAsyncContentView where LoadingView == DefaultProgressView {
    init(source:Source,
         @ViewBuilder content:@escaping (Source.Output)->Content
    ) {
        self.init(
            source:source,
            loadingView:ProgressView(),
            content:content
        )
    }
}
