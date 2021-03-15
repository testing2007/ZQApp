//
//  RecommendView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/15.
//

import Foundation
import SwiftUI

struct RecommendContentView : View {
    var courseItem:CourseItemModel?
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
                
                Text(_courseItem.gradeName ?? "")
                    .lineLimit(2)
                    .modifier(ZQMediumFont(fontSize: 16))
                    .frame(height: 45, alignment: .topLeading)
                
                Text(_courseItem.description ?? "")
                    .modifier(ZQRegularFont(fontSize: 11))
                Text(self.priceDesc(_courseItem.currentPrice ?? 0))
                    .modifier(ZQRegularFont(fontSize: 13)).offset(y:-0)
            })
            .border(Color.red, width: 0.2)
            .frame(width: 150, height:245, alignment: .topLeading)
        )
    }
    
    func priceDesc(_ price:Int) -> String {
        if(price == 0) {
            return "免费"
        } else {
            return  String(price) + String(" 学币")
        }
    }
    
}

struct RecommendContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let recommends:[CourseItemModel]? = [
            CourseItemModel(gradeName: "111112333333333333333333333333344444", currentPrice:0, description: "111"),
            CourseItemModel(gradeName: "22222", currentPrice:0, description: "222"),
            CourseItemModel(gradeName: "33333", currentPrice:0, description: "333"),
        ]
        if recommends != nil && recommends!.count > 0 {
            VStack(alignment: .leading){
                Text("推荐课程")
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 20, content: {
                        ForEach(recommends!, id:\.self) { item in
                            RecommendContentView(courseItem:item)
                        }
                    })
                }.frame(height: 245, alignment: .leading)
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

        } else {
            Text("emptyView")
        }
    }
}

struct RecommendView : View {
    var recommends:[CourseItemModel]?
    var body: some View {
        if recommends != nil && recommends!.count > 0 {
            VStack(alignment: .leading){
                Text("推荐课程")
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 20, content: {
                        ForEach(recommends!, id:\.self) { item in
                            RecommendContentView(courseItem:item)
                        }
                    })
                }.frame(height: 245, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

        } else {
            Text("emptyView")
        }
        
    }
}
