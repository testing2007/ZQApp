//
//  ZQLoadableObject.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/5.
//

import Foundation
import Moya
import HandyJSON

protocol ZQLoadableObject : ObservableObject {
    associatedtype Output //实际需要输出的
    var state:ZQLoadingState<Output> { get }
    func load()
}
