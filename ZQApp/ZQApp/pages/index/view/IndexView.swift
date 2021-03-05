//
//  IndexView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import SwiftUI
import Moya

struct IndexView: BaseView {
    @State private var indexVM:IndexViewModel = IndexViewModel()
    
    func contentLoaded() -> Bool {
        //Ask viewModel if content is loaded
        indexVM.request{ (_ bSuccess:Bool, _ data: [IndexModel]?) in
            if(bSuccess) {
                //成功
            } else {
                //失败
            }
        }
        return false
    }
    
    var loadedBody : some View {
        Text("content is loaded")
    }
    
    var unloadedBody: some View {
        Text("Fetching content...")
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some BaseView {
        IndexView()
    }
}
