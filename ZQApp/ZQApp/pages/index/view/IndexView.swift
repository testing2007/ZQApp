//
//  IndexView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import SwiftUI
import Moya

struct IndexView: View {
//    @State private var indexVM:IndexViewModel = IndexViewModel()
    
//    @State private var res : Bool = false
//
//    func contentLoaded() -> Bool {
//        //Ask viewModel if content is loaded
//        indexVM.request{ (_ bSuccess:Bool, _ data: [IndexModel]?) in
//            res = bSuccess
//            if(bSuccess) {
//                //成功
////                loadedBody
//            } else {
//                //失败
////                unloadedBody
//            }
//        }
//        return res
//    }
//
//    var loadedBody : some View {
//        Text("content is loaded")
//    }
//
//    var unloadedBody: some View {
//        Text("Fetching content...")
//    }
    
    @ObservedObject var indexVM : IndexViewModel = IndexViewModel()
    var body: some View {
        AsyncContentView(source: indexVM) { data in
            Text(data?[0].tagName ?? "sss")
//            self.indexVM.
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
