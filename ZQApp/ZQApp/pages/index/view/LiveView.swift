//
//  LiveView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/15.
//

import SwiftUI
import Kingfisher

struct LiveContentView : View {
    var courseItem:CourseItemModel?
    var body:some View {
        guard let item = courseItem else {
            // We have to use 'AnyView' to perform type erasure here,
            // in order to give our 'body' a single return type:
            return AnyView(EmptyView())
        }
        
        return AnyView(
            VStack(alignment:.leading, content: {
                HStack(alignment: .top, content: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        ZStack(alignment: .topLeading, content: {
                            let dummyString = "aaaaaaa"
                            Text( dummyString + (item.gradeName ?? "")).modifier(ZQRegularFont(fontSize: 15))
                                .lineLimit(2)
                            Text("直播课")
                                .padding(EdgeInsets(top: 2, leading: 10, bottom: 0, trailing: 10))
                                .background(Color.orange)
                                .cornerRadius(8.0)
                                .modifier(ZQRegularFont(fontSize: 13))
                        })

                        
                        Text(item.description ?? "")
                            .modifier(ZQMediumFont(fontSize: 13))
                            .lineLimit(2)
                    })
                    
                    Spacer()
                    
                    KFImage(URL(string: item.bannerUrl ?? ""))
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 85, height: 65)
                        .cornerRadius(5)
                }).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10))
                
                HStack(content: {
                    Text(item.currentPriceDesc)
                        .modifier(ZQRegularFont(fontSize: 13))
                    Text(item.learndCountDesc)
                        .modifier(ZQRegularFont(fontSize: 13))
                    Spacer()
                    Text(item.liveTimeDesc).modifier(ZQRegularFont(fontSize: 13))
                }).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            })
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            .frame(height:125, alignment: .topLeading)
            .cornerRadius(10)
            .background(Color.white.shadow(color: .black, radius: 5, x:2, y:5))
        )
    }
}

struct LiveContentView_Previews: PreviewProvider {
    static var previews: some View {
//        var gradeName:String? //title
//        var courseType:Int? //课程类型
//        var bannerUrl:String? //图片
//        var currentPrice:Int? //学币
//        var description:String? //描述
//        var sort:Int?
//        var liveStartTime:String? //直播开始时间
//        var liveEndTime:String? //直播结束时间
//        var bigimgPath:String?
//        var learndCount:Int? //学习人数
        let lives:[CourseItemModel]? = [
            CourseItemModel(gradeName: "111112333333333333333333333333344444", currentPrice:10, description: "111", liveStartTime: "2020-10-01", liveEndTime: "2021-01-01", learndCount:10),
            CourseItemModel(gradeName: "22222", currentPrice:20, description: "222", liveStartTime: "2020-10-01", liveEndTime: "2021-01-01", learndCount:10),
            CourseItemModel(gradeName: "33333", currentPrice:30, description: "333", liveStartTime: "2020-10-01", liveEndTime: "2021-01-01", learndCount:10),
        ]
        if lives != nil && lives!.count > 0 {
            VStack(alignment: .leading){
                Text("直播课")
                ForEach(lives!, id:\.self) { item in
                    LiveContentView(courseItem:item)
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
        } else {
            Text("emptyView")
        }
    }
}

struct LiveView: View {
    var lives:[CourseItemModel]?
    var body: some View {
        if lives != nil && lives!.count > 0 {
            VStack(alignment: .leading){
                Text("直播课")
                ForEach(lives!, id:\.self) { item in
                    LiveContentView(courseItem:item)
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
        } else {
            Text("emptyView")
        }
        
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}


