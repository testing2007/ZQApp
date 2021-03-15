//
//  LiveView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/15.
//

import SwiftUI


struct LiveContentView : View {
    var courseItem:CourseItemModel?
    var body:some View {
        guard courseItem != nil else {
            // We have to use 'AnyView' to perform type erasure here,
            // in order to give our 'body' a single return type:
            return AnyView(EmptyView())
        }
        
        return AnyView(
            VStack(alignment:.leading, content: {
                HStack(alignment: .top, content: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        ZStack(alignment: .topLeading, content: {
                            Text("直播课").padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)).background(Color.orange).cornerRadius(8.0).modifier(ZQRegularFont(fontSize: 13))
                            Text("                 haha\ndfdfddffdffdfdffdfdffdfdffdfdfdffdfdfdffdfdfdfdfdfffdfdfdfdfdfdfdfdfdfdfdfdfdfdfdf").modifier(ZQRegularFont(fontSize: 13)).lineLimit(2)
                        })
                        
                        Text("desc\n\n\n").modifier(ZQMediumFont(fontSize: 13))
                            .lineLimit(2)
                    })
                    
                    Spacer()
                    
                    Image("recommend")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 85, height: 65)
                        .cornerRadius(5)
                })
                
                HStack(content: {
                    Text("2980.00").modifier(ZQRegularFont(fontSize: 13))
                    Text("57人").modifier(ZQRegularFont(fontSize: 13))
                    Spacer()
                    Text("2021.06.05-08.28").modifier(ZQRegularFont(fontSize: 13))
                })
            })
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            .frame(height:125, alignment: .topLeading)
        )
    }
}

struct LiveContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let lives:[CourseItemModel]? = [
            CourseItemModel(gradeName: "111112333333333333333333333333344444", currentPrice:0, description: "111"),
            CourseItemModel(gradeName: "22222", currentPrice:0, description: "222"),
            CourseItemModel(gradeName: "33333", currentPrice:0, description: "333"),
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


