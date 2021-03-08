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
//                self?.state = .failed(error)
                //self?.state = .failed(Error(""))
            }
        }
    }
    
}
