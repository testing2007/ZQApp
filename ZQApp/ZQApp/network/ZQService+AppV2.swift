//
//  ZQService+App.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation
import Moya
import HandyJSON
import Result
import MBProgressHUD

extension MoyaProvider {
    @discardableResult
    func baseRequestV2<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ bSuccess:Bool, _ returnData: T?, _ error:Error?) -> Void)?) -> Cancellable? {
        
        return baseRequest(target, completion: {(result) in
            
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(ZQServiceModelV2<T>.self) else {
                //TODO: 打印错误日志， 404 也返回 result.success
                switch result {
                    case let .success(moyaResponse):
                        do {
                            let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes() // gives back a Response or throws an error. status code is 200-299
                            //TODO:异常
//                            completion(false, nil, Error(domain:"", code:0, userInfo:""))
                        }
                        catch let error {
                            completion(false, nil, error)
                        }
                    case let .failure(error):
                        completion(false, nil, error)
                }
                return
            }
           
            if(returnData.status == 200) {
                //TODO: 打印网络日志(URL / 请求方式 / 请求参数 / 数据响应)
                //成功
                completion(true, returnData.result, nil)
                
            } else {
                //TODO: 打印网络日志
                //失败
                //可以设置自定义错误
                completion(false, nil, result.error)
            }
            
        })
    }
    
    open func getIndex<T: HandyJSON>(
        model: T.Type,
        completion: ( (_ bSuccess:Bool, _ returnData: T?, _ error:Error?) -> Void )?
    ) -> Cancellable? {
        self.baseRequestV2(ZQService.index as! Target, model: model, completion: { (bSuccess:Bool, returnData:T?, error:Error?) in
            guard let completion = completion else { return }
            completion(bSuccess, returnData, error)
        })
    }
}
