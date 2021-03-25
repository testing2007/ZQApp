//
//  LoadableObject.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/5.
//

import Foundation
import Moya
import HandyJSON

protocol LoadableObject : ObservableObject {
    associatedtype Output //实际需要输出的
    var state:LoadingState<Output> { get }
    func load()
}
