//
//  IndexViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation

enum CourseType:Int {
    case live = 0
    case recommend
    case career
    case primary
    case free
}

class IndexViewModel : ZQLoadableObject {
    var indexData : [IndexModel]? = nil
    var lives: [CourseItemModel]? //直播课
    var recommends : [CourseItemModel]? //推荐课程
    var primaries: [CourseItemModel]? //优质好课
    var frees:[CourseItemModel]? //免费好客
    
    @Published private(set) var state = ZQLoadingState<[IndexModel]?>.idle
    
    func load() {
        state = .loading
        
        ApiLoadingProvider.getIndex(model:[IndexModel].self) { [weak self] (bSuccess, returnData, error) in
            if(bSuccess) {
                //成功
                self?.indexData = returnData
                self?.state = .loaded(returnData)
                self?._filter()
            } else {
                //失败
                self?.indexData = nil
                self?.state = .failed(error!)
            }
        }
    }
    
    func _filter() {
        guard let _data = self.indexData else { return ;}
        for category in _data {
            let courses = category.courses
            guard let _courses = courses else { continue; }
            if(category.sort == CourseType.live.rawValue) {
                _filterLiveCourse(courses: _courses)
            } else if(category.sort == CourseType.recommend.rawValue) {
                _filterRecommendCourse(courses: _courses)
            } else if(category.sort == CourseType.career.rawValue) {
            } else if(category.sort == CourseType.primary.rawValue) {
                _filterPrimaryCourse(courses: _courses)
            } else if(category.sort == CourseType.free.rawValue) {
                _filterFreeCourse(courses: _courses)
            } else {
                //do nothing
            }
            
        }
    }
    
    func _filterLiveCourse(courses: [CourseItemModel]) {
        for item in courses {
            if(lives == nil) {
                lives = []
            }
            lives?.append(item)
        }
    }
    
    func _filterRecommendCourse(courses: [CourseItemModel]) {
        for item in courses {
            if(recommends == nil) {
                recommends = []
            }
            recommends?.append(item)
        }
    }
    
    func _filterPrimaryCourse(courses: [CourseItemModel]) {
        for item in courses {
            if(primaries == nil) {
                primaries = []
            }
            primaries?.append(item)
        }
    }
    
    func _filterFreeCourse(courses: [CourseItemModel]) {
        for item in courses {
            if(frees == nil) {
                frees = []
            }
            frees?.append(item)
        }
    }
    
}
