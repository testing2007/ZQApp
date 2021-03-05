//
//  AsyncContentView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/5.
//

import Foundation
import SwiftUI
import Combine

struct AsyncContentView<Source:LoadableObject, Content:View> : View {
    @ObservedObject var source:Source
    var content:(Source.Output) -> Content
    
    init(source:Source, @ViewBuilder content: @escaping (Source.Output) -> Content) {
        self.source = source
        self.content = content
    }
    
    var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            ProgressView()
        case .failed(let error):
            Text("errorView")
//            ErrorView(error:error, retryHandler: source.load)
        case .loaded(let output):
            content(output)
        }
    }
}
