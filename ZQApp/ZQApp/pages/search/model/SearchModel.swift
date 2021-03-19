//
//  SearchModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation
import HandyJSON

struct SearchItemModel: HandyJSON, Hashable, Identifiable {
    var id:Int? //给每个元素设置生成的id
    
    var courseId:Int?
    var courseName:String? //中间含有HTML格式
    var courseImg:String? //图标url地址
    var subjectId:Int?
    var description:String?
//    var isFree:Bool? //是否免费
//    var learndCount:Int?
}

struct SearchModel : HandyJSON, Hashable {
    var items:[SearchItemModel]?
    var totalCount:Int?
    var totalPageCount:Int?
    var pageSize:Int?
    var currentPage:Int?
    var prevPage:Int?
    var nextPage:Int?
}
