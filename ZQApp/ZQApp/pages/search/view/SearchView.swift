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
        guard let items = self.vm.searchData?.items else {
            return AnyView(EmptyView())
        }

        return AnyView(
            VStack(alignment: .leading) {
                Text("搜索结果为\(items.count)")
                
                ForEach(items, id:\.self) { item in
//                    LiveContentView(courseItem:item)
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
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
