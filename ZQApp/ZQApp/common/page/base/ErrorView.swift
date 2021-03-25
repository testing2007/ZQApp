//
//  ErrorView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/8.
//

import SwiftUI
import Moya

struct ErrorView: View {
    let error:Error?
    let retryHandler:(() -> Void)?

    var body: some View {
        if let newError = error {
            if let moyaError = newError as? MoyaError {
                Text("\(moyaError.errorDescription!)")
            } else {
                Text("\(newError.localizedDescription)")
            }
        } else {
            Text("很抱歉，出现错误")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error:nil, retryHandler:{ ()->Void in
            print("ErrorView_Previews")
        })
    }
}
