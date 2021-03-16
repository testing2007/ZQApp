//
//  RecommendView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/15.
//

import Foundation
import SwiftUI
import Kingfisher

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
                KFImage(URL(string: _courseItem.bannerUrl ?? ""))
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height: 155, alignment: .leading)
                
                Text(_courseItem.gradeName ?? "")
                    .lineLimit(2)
                    .modifier(ZQMediumFont(fontSize: 16))
                    .frame(height: 45, alignment: .topLeading)
                
                Text(_courseItem.description ?? "")
                    .modifier(ZQRegularFont(fontSize: 11))
                Text(_courseItem.currentPriceDesc)
                    .modifier(ZQRegularFont(fontSize: 13))
            })
            .cornerRadius(5)
            .background(Color.white.cornerRadius(5).shadow(color: .black, radius: 2))
            .frame(width: 150, height:245, alignment: .topLeading)
        )
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
            VStack(alignment: .leading, spacing:10){
                Text("推荐课程")
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack(alignment: .top, spacing: 10, content: {
                        ForEach(recommends!, id:\.self) { item in
                            RecommendContentView(courseItem:item)
                        }
                    }).frame(height: 245, alignment: .leading)
                }
                
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
        } else {
            Color.clear //空view
        }
    }
}

struct RecommendView : View {
    var recommends:[CourseItemModel]?
    var body: some View {
        if recommends != nil && recommends!.count > 0 {
            VStack(alignment: .leading, spacing:10){
                Text("推荐课程")
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack(alignment: .top, spacing: 20, content: {
                        ForEach(recommends!, id:\.self) { item in
                            RecommendContentView(courseItem:item)
                        }
                    })
                }.frame(height: 245, alignment: .leading)
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
        } else {
            Color.clear //空view
        }
    }
}
