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
    var currentPriceDesc:String {
        get {
            guard let _price = currentPrice else {
                return "免费"
            }
            
            if(_price == 0) {
                return "免费"
            } else {
            return  String(_price) + String(" 学币")
            }
        }
    }
    var description:String? //描述
    var sort:Int?
    var liveStartTime:String? //直播开始时间
    var liveEndTime:String? //直播结束时间
    var liveTimeDesc:String {
        get {
            guard let _liveStartTime = liveStartTime else {
                return ""
            }
            guard let _liveEndTime = liveEndTime else {
                return ""
            }

            return String(_liveStartTime) + String("-") + String(_liveEndTime)
        }
    }
    var bigimgPath:String?
    var learndCount:Int? //学习人数
    var learndCountDesc:String {
        get {
            guard let _learndCount = learndCount else {
                return "0"
            }
            
            if(_learndCount == 0) {
                return "0"
            } else {
            return  String(_learndCount) + String("人")
            }
        }
    }
    
}

struct IndexModel : HandyJSON, Hashable {
    var courses:[CourseItemModel]?
    var id:Int?
    var sort:Int?
    var tagName:String?
}

