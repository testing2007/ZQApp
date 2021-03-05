//
//  LoadableObject.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/5.
//

import Foundation

protocol LoadableObject : ObservableObject {
    associatedtype Output //实际需要输出的
    var state:LoadingState<Output> { get }
    func load()
}
