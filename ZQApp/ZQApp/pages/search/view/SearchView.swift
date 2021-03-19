//
//  SearchView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation
import SwiftUI

struct SearchContentView : View {
    var vm: SearchViewModel
    init(vm:SearchViewModel) {
        self.vm = vm
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().tableHeaderView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        let items = self.vm.searchData
        if items.count == 0 {
            return AnyView(EmptyView())
        }

        return AnyView(
            List(items) {item in
                VStack(alignment: .leading) {
                    Text(item.description ?? "")
                }.onAppear() {
                    self.vm.isLastItem(item)
                }
            }
        )


    }
}


struct SearchView: View {
    @ObservedObject var searchVM : SearchViewModel = SearchViewModel()
    
    var body: some View {
        AsyncContentView(source:searchVM,
                         loadingView:Placeholder()) { data in
            SearchContentView(vm: searchVM)
        }
    }
}



extension SearchView {
    struct Placeholder:View {
        var body: some View {
            Text("placeholder View")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
