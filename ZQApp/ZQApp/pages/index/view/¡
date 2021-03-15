//
//  IndexView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//
import UIKit
import SwiftUI
//import Moya




struct IndexContentView : View {
    var vm: IndexViewModel
    init(vm:IndexViewModel) {
        self.vm = vm
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().tableHeaderView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List {
            LiveView(lives: self.vm.lives)
            RecommendView(recommends: self.vm.recommends)
        }
    }
}


struct IndexView: View {
    @ObservedObject var indexVM : IndexViewModel = IndexViewModel()
    
    var body: some View {
        AsyncContentView(source:indexVM,
                         loadingView:Placeholder()) { data in
            IndexContentView(vm: indexVM)
        }
    }
}



extension IndexView {
    struct Placeholder:View {
        var body: some View {
            Text("placeholder View")
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
