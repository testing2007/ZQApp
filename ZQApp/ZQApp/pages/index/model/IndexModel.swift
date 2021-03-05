//
//  IndexModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import HandyJSON

struct CourseItemModel: HandyJSON {
    var gradeName:String?
}

struct IndexModel : HandyJSON {
    var courses:[CourseItemModel]?
    var id:Int?
    var sort:Int?
    var tagName:String?
}

