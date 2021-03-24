//
//  SearchViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation

class SearchViewModel : LoadableObject {

    var refreshing:Bool = false
    var loadover:Bool = true
//    var bottomRefreshable:Bool = true
//    var showNoMoreData:Bool=true
//    var showBottomLoading:Bool=true
//    var noDataPrompt:String="数据无"

    var max:Int=0
    var searchData: [SearchItemModel] = []
    var pageIndex:Int = 0

    @Published private(set) var state = LoadingState<[SearchItemModel]?>.idle
    
    func load() {
        
        loadMore()
        
    }
    
//    var canLoadMore: Bool {
//        if (self.refreshing) {
//            return true
//        } else {
//            NSLog("self.searchData.count=%ld, max=%ld", self.searchData.count, max)
//            return self.searchData.count < max
//        }
//
//    }
    
    func refresh() {
        self.max = 0
        self.pageIndex = 0
        self.searchData = []
        self.loadMore()
    }
    
    func loadMore() {
//        state = .loading
        
        ApiProvider.postSearch(model: SearchModel.self, courseTypes: "3,4,5,6", keyword: "1", page: pageIndex+1, pageSize: 10) {  (bSuccess, returnData, error) in
            self.refreshing = false
            if(bSuccess) {
//                self?.searchData = returnData
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
