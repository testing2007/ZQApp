//
//  IndexViewModel.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import Moya
import HandyJSON

class IndexViewModel : BaseViewModel {
    var indexData : [IndexModel]? = nil
    let provider = MoyaProvider<Service>()
    
    override init() {
    }
    func request(completion: @escaping (_ bSuccess:Bool, _ result:[IndexModel]?) -> Void ){
        ApiLoadingProvider.request(Service.index, model:[IndexModel].self ) { [self] (bSuccess, returnData) in
            if(bSuccess) {
                //成功
                self.indexData = returnData
            } else {
                //失败
                self.indexData = nil
            }
            completion(bSuccess, self.indexData)
        }
        


    }
    
    
}
