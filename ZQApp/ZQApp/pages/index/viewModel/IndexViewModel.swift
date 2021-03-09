//
//  IndexViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import Moya
import HandyJSON

class IndexViewModel : LoadableObject {
    var indexData : [IndexModel]? = nil
    let provider = MoyaProvider<Service>()
    var recommends : [CourseItemModel]?
    
    @Published private(set) var state = LoadingState<[IndexModel]?>.idle
    
    func load() {
        state = .loading
        
        ApiLoadingProvider.request(Service.index, model:[IndexModel].self ) { [weak self] (bSuccess, returnData, error) in
            if(bSuccess) {
                //成功
                self?.indexData = returnData
                self?.state = .loaded(returnData)
            } else {
                //失败
                self?.indexData = nil
                self?.state = .failed(error!)
            }
        }
    }
    
    func filter() -> [CourseItemModel]? {
        self.recommends = nil
        guard let _data = self.indexData else { return nil ;}
        for category in _data {
            if category.id == 2 {
                let courses = category.courses
                guard let _courses = courses else { continue; }
                for item in _courses {
                    if(recommends == nil) {
                        recommends = []
                    }
                    recommends?.append(item)
                }
            }
        }
        return recommends
    }
    
}
