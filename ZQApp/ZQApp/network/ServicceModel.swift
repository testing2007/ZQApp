//
//  ServiceParser.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import HandyJSON

extension Array: HandyJSON{} //这个很重要，如果结果返回解决类似 数组套字典的 json 格式 比如：(result:[{}, {}])

struct ServiceModel<T:HandyJSON> : HandyJSON {
    var status:Int? //自定义返回网络状态码
    var message:String?//消息
    var result:T? //自定义返回类型
}
