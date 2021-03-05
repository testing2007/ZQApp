//
//  ServiceModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import HandyJSON

struct ServiceModel<T:HandyJSON> : HandyJSON {
    var status:Int?
    var message:String?
    var result:T?
}
