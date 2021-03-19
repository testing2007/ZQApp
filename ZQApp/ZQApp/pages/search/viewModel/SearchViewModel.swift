//
//  SearchViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation

class SearchViewModel : LoadableObject {

    var searchData: [SearchItemModel] = []
    var pageIndex:Int = 0

    @Published private(set) var state = LoadingState<[SearchItemModel]?>.idle
    
    func load() {
        
//        _pageLoad()
        
    }
    
    func isLastItem<T:Identifiable>(_ item:T) {
//        if self.searchData.isThresholdItem(offset: 10, item: item) {
        if self.searchData.isLastItem(item) {
             self._pageLoad()
         }
    }
    
    func _pageLoad() {
        state = .loading
        
        ApiLoadingProvider.postSearch(model: SearchModel.self, courseTypes: "3,4,5,6", keyword: "1", page: pageIndex+1, pageSize: 10) {  (bSuccess, returnData, error) in
            if(bSuccess) {
//                self?.searchData = returnData
                guard let returnData = returnData else {
                    self.state = .loaded(self.searchData)
                    return
                }
                
                self.pageIndex = self.pageIndex + 1

                self.searchData.append(contentsOf:returnData.items ?? [])
                
    
                func _modifyId(_ item:inout SearchItemModel, _ index:Int) {
                    item.id = index
                }
                
                var i = 0
                for (i, item) in self.searchData.enumerated() {
//                    print("在 index = \(index) 位置上的值为 \(item)")
                    _modifyId(&self.searchData[i], i)
                }
                
                
                self.state = .loaded(self.searchData)
                print("success")
            } else {
                print("fail")
            }
        }

    }
    
    

}
