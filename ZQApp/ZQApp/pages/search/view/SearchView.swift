//
//  SearchView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/19.
//

import Foundation
import SwiftUI

struct SearchContentView : View {
    @ObservedObject var vm: SearchViewModel //一定要带上 @ObservedObject， 否则加载下一页就不能刷新界面
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
            BRefreshableScrollView(height: 80, refreshing: self.$vm.refreshing, loadover: self.$vm.loadover, action: {
                self.vm.refresh()
            }, footerAction: {
                self.vm.loadMore()
            }, content: {
                ForEach.init(items, id: \.self) { item in
                                        Text("\(item.courseId ?? 0)")
                                            .frame(height: 50)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.init(white: 0.9).clipShape(RoundedRectangle(cornerRadius: 8))
                                                            .shadow(radius: 4))
                                            .padding(4)
                                    }
            })
        )
    }
}


struct SearchView: View {
    @ObservedObject var searchVM : SearchViewModel = SearchViewModel()
    
    var body: some View {
        AsyncContentView(source:searchVM) { data in
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


//            addPullRefresh(refreshing: self.$vm.refreshing, loadover: self.$vm.loadover, headerAction: {
//                self.vm.refresh()
//            }, footerAction: {
//                self.vm.loadMore()
//            })
            
            
            
            
//            ScrollView {
//                LazyVStack {
//                    ForEach.init(items, id: \.self) { item in
////                        Text(item.courseName ?? "")
//                        Text("\(item.courseId ?? 0)")
//                            .frame(height: 50)
//                            .frame(maxWidth: .infinity)
//                            .background(Color.init(white: 0.9).clipShape(RoundedRectangle(cornerRadius: 8))
//                                            .shadow(radius: 4))
//                            .padding(4)
//                    }
//
//                    if self.vm.canLoadMore {
//                        Text("Loading ...")
//                            .padding()
//                            .onAppear {
//                                debugPrint("onAppear")
//                                self.vm.loadMore()
//                            }
//                    }
//
//                }
//
//            }
            
            
//            List {
//
//                ForEach(items, id:\.self) { item in
//                    Text(item.courseName ?? "")
//                }
//                Button(action: loadMore) {
//                       Text("")
//                }
//            }
