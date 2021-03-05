//
//  IndexView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//

import SwiftUI
import Moya

struct IndexView: View {
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
