//
//  SearchViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation

class SearchViewModel : ZQLoadableObject {

    var refreshing:Bool = false
    var loadover:Bool = true

    var max:Int=0
    var searchData: [SearchItemModel] = []
    var pageIndex:Int = 0

    @Published private(set) var state = ZQLoadingState<[SearchItemModel]?>.idle
    
    func load() {
        
        NSLog("load")
        load(true)
        
    }
    
    
    func refresh() {
        NSLog("refresh")
        let isShowLoading:Bool = self.pageIndex == 0 ? true : false
        self.max = 0
        self.pageIndex = 0
        self.searchData = []
        self.load(isShowLoading)
        
    }
    
    func loadMore() {
        if(self.max > self.searchData.count) {
            self.load(false)
        }
    }
    
    func load(_ isShowLoading:Bool) {
//        state = .loading
        ApiLoadingProvider.postSearch(model: SearchModel.self, courseTypes: "3,4,5,6", keyword: "1", page: pageIndex+1, pageSize: 10) {  (bSuccess, returnData, error) in
            self.refreshing = false
            if(bSuccess) {
                guard let returnData = returnData else {
                    self.state = .loaded(self.searchData)
                    return
                }
                
                self.pageIndex = self.pageIndex + 1

                self.searchData.append(contentsOf:returnData.items ?? [])
                
                self.max = returnData.totalCount ?? self.searchData.count;
                
                if(self.max == self.searchData.count) {
                    self.loadover = true
                } else {
                    self.loadover = false
                }
                
                self.state = .loaded(self.searchData)
                
                print("success")
            } else {
                print("fail")
            }
        }

    }
    
    

}
