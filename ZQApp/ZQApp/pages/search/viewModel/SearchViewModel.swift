//
//  SearchViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation

class SearchViewModel : LoadableObject {

    var searchData: SearchModel? = nil

    @Published private(set) var state = LoadingState<SearchModel?>.idle
    
    func load() {
        state = .loading
        
        ApiLoadingProvider.postSearch(model: SearchModel.self, courseTypes: "3,4,5,6", keyword: "1", page: 1, pageSize: 10) {  [weak self] (bSuccess, returnData, error) in
            if(bSuccess) {
                self?.searchData = returnData
                self?.state = .loaded(returnData)
                print("success")
            } else {
                print("fail")
            }
        }
    }

}
