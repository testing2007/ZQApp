//
//  ServiceZQLoadingState.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/5.
//

import Foundation

enum ZQLoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value) //Value就是我们实际需要获取的数据模型
}
