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
    
    //    @Published private(set) var state = LoadingState<[IndexModel]?>.idle
    @Published private(set) var state = LoadingState<[IndexModel]?>.idle
    
    var data:[IndexModel]? { get {
        return self.indexData
    }  set {
        self.indexData = newValue
    }
    }
    //    var state:LoadingState {
    //        return state
    //    }
    
    //    init() {
    //        self.state = LoadingState<Output>.idle
    //    }
    //    @Published private(set) var state = State.idle
    
    //    override init() {
    //    }
    //    func request(completion: @escaping (_ bSuccess:Bool, _ result:[IndexModel]?) -> Void ){
    //        ApiLoadingProvider.request(Service.index, model:[IndexModel].self ) { [self] (bSuccess, returnData) in
    //            if(bSuccess) {
    //                //成功
    //                self.indexData = returnData
    //            } else {
    //                //失败
    //                self.indexData = nil
    //            }
    //            completion(bSuccess, self.indexData)
    //        }
    //    }
    //
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
//                self?.state = .failed(Error(""))
            }
        }
    }
    
}
