//
//  service.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import Foundation
import Moya
import HandyJSON
import Result
import MBProgressHUD

enum Service {
    case index
//    case createUser(firstName: String, lastName: String)
//    case updateUser(id: Int, firstName: String, lastName: String)
}

extension Service : TargetType {
    var baseURL: URL { return URL(string: "https://app.boxuegu.com")! }
    var path: String {
        switch self {
        case .index:
            return "/home/home-courses"
        }
    }
    var method: Moya.Method {
        switch self {
        case .index:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .index: // Send no parameters
            return .requestPlain
//        case let .updateUser(_, firstName, lastName):  // Always sends parameters in URL, regardless of which HTTP method is used
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
//        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {
        case .index:
            return "".data(using: String.Encoding.utf8)!
//            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
    var headers: [String: String]? {
        return [
            "Content-type": "application/json",
            "bxg-os":"iOS",
            "bxg-platform":"iPhone",
            "bxg-version": "v1.0.0",
            "bxg-imei":"haha"
        ]
    }
}

let LoadingPlugin = NetworkActivityPlugin { (type, target) in
    DispatchQueue.global().async {
        DispatchQueue.main.async {
            guard let vc = topVC else { return }
            switch type {
            case .began:
                MBProgressHUD.hide(for: vc.view, animated: false)
                MBProgressHUD.showAdded(to: vc.view, animated: true)
            case .ended:
                MBProgressHUD.hide(for: vc.view, animated: true)
            }
        }
    }
}

let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<Service>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<Service>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<Service>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ bSuccess:Bool, _ returnData: T?) -> Void)?) -> Cancellable? {
        
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(ServiceModel<T>.self) else {
                //TODO: 打印错误日志
                completion(false, nil)
                return
            }
            if(returnData.status == 200) {
                //TODO: 打印网络日志(URL / 请求方式 / 请求参数 / 数据响应)
                //成功
                completion(true, returnData.result)
            
            } else {
                //TODO: 打印网络日志
                //失败
                //可以设置自定义错误
            
                completion(false, returnData.result)
            }

        })
    }
}
