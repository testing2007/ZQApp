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
    var courseType:Int? //课程类型
    var bannerUrl:String? //图片
    var currentPrice:Int? //学币
    var description:String? //描述
    var sort:Int?
    var liveStartTime:String? //直播开始时间
    var liveEndTime:String? //直播结束时间
    var bigimgPath:String?
    var learndCount:Int? //学习人数
    
}

struct IndexModel : HandyJSON, Hashable {
    var courses:[CourseItemModel]?
    var id:Int?
    var sort:Int?
    var tagName:String?
}

