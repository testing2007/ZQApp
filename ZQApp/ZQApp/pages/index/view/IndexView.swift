//
//  IndexView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/4.
//
import UIKit
import SwiftUI
//import Moya

struct RecommendContentView : View {
    var courseItem:CourseItemModel?
    
    func priceDesc(_ price:Int) -> String {
        if(price == 0) {
            return "免费"
        } else {
            return  String(price) + String(" 学币")
        }
    }
    
    
    var body:some View {
        guard let _courseItem = courseItem else {
            // We have to use 'AnyView' to perform type erasure here,
            // in order to give our 'body' a single return type:
            return AnyView(EmptyView())
        }
        
        return AnyView(
            VStack(alignment:.leading, content: {
//                Image(_courseItem.bannerUrl ?? "")
                Image("recommend")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155, alignment: .leading)
                    .cornerRadius(5)
                    .border(Color.orange, width: 2)
                
                Text(_courseItem.gradeName ?? "")
                    .lineLimit(2)
                    .modifier(ZQMediumFont(fontSize: 16))
                    .frame(height: 45, alignment: .topLeading)
                
                    Text(_courseItem.description ?? "")
                        .modifier(ZQRegularFont(fontSize: 11))
                    Text(self.priceDesc(_courseItem.currentPrice ?? 0))
                        .modifier(ZQRegularFont(fontSize: 13)).offset(y:-0)
            })
            .border(Color.red, width: 2)
            .frame(width: 150, height:245, alignment: .topLeading)
        )
        
    }
}

struct RecommendContentView_Previews: PreviewProvider {
    static var previews: some View {

        var recommends:[CourseItemModel]? = [CourseItemModel(gradeName: "111112333333333333333333333333344444", currentPrice:0, description: "111"),
                                             CourseItemModel(gradeName: "22222", currentPrice:0, description: "222"),
                                             CourseItemModel(gradeName: "33333", currentPrice:0, description: "333"),
                        ]
        if recommends != nil && recommends!.count > 0 {
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 50, content: {
                    ForEach(recommends!, id:\.self) { item in
                        RecommendContentView(courseItem:item)
                    }
                })
            }.frame(height: 245, alignment: .leading)
            .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        } else {
            Text("emptyView")
        }
    }
}

struct IndexView: View {
    @ObservedObject var indexVM : IndexViewModel = IndexViewModel()
    var recommends:[CourseItemModel]?
    
    var body: some View {
        AsyncContentView(source:indexVM,
                         loadingView:Placeholder()) { data in
            let recommends = self.indexVM.filter()
            if recommends != nil && recommends!.count > 0 {
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 20, content: {
                        ForEach(recommends!, id:\.self) { item in
                            RecommendContentView(courseItem:item)
                        }
                    })
                }.frame(height: 245, alignment: .leading)
                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            } else {
                Text("emptyView")
            }
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

struct IndexRecommendView : View {
    var body: some View {
        Text("")
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
