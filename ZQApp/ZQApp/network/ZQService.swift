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

enum ZQService {
    case index
    case search(courseTypes:String, keyword:String, page: Int, pageSize:Int)
}

extension ZQService : TargetType {
    var baseURL: URL { return URL(string: "https://app.boxuegu.com")! }
    var path: String {
        switch self {
        case .index:
            return "/home/home-courses"
        case let .search(courseTypes, keyword, page, pageSize):
            return "/bxg/search/courseSearch"
        }
    }
    var method: Moya.Method {
        switch self {
        case .index:
            return .get
        case let .search(courseTypes, keyword, page, pageSize):
            return .post
        }
    }
    var task: Task {
        switch self {
        case .index: // Send no parameters
            return .requestPlain
        case let .search(courseTypes, keyword, page, pageSize):
            return .requestParameters(parameters: [
                "courseTypes": courseTypes,
                "keyword": keyword,
                "page": page,
                "pageSize": pageSize,
            ],encoding: URLEncoding.httpBody)
//            encoding: JSONEncoding.default)//encoding: URLEncoding.queryString
        
        }
    }
    var sampleData: Data {
        switch self {
        case .index:
            return "".data(using: String.Encoding.utf8)!
        case let .search(courseTypes, keyword, page, pageSize):
            return "".data(using: String.Encoding.utf8)!
        }
    }
    var headers: [String: String]? {
        return [
//            "Content-type": "application/json",
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

let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<ZQService>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<ZQService>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<ZQService>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])

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
    func baseRequest(
        _ target: Target,
        completion: @escaping (_ result: Result<Moya.Response, MoyaError>) -> Void
    ) -> Cancellable? {
        return request(target, completion: {(bresult) in
            completion(bresult)
        })
    }
}
