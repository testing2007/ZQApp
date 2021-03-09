//
//  IndexModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import HandyJSON

struct CourseItemModel: HandyJSON, Hashable {
    var gradeName:String? //title
//    var courseType:Int
    var bannerUrl:String? //图片
    var currentPrice:Int? //学币
    var description:String? //描述
//    var sort:Int?
//    var liveStartTime:String?
//    var bigimgPath:String?
//    var learn
    
}

struct IndexModel : HandyJSON, Hashable {
    var courses:[CourseItemModel]?
    var id:Int?
    var sort:Int?
    var tagName:String?
}

