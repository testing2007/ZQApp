//
//  testAlignmentGuide.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/15.
//

import SwiftUI

struct LabelView : View {
    var title:String
    var color:Color
    var body: some View {
        return Text(title).background(color)
    }
}

struct testAlignmentGuide: View {
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            Text("Hello")
//                .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return 30 })
//                .background(Color.green)
//
//            Text("Worlddfdfdfdfdfdffdfdfddfddfdfdfdfdfdfdfdfdfddffddfdfdffdfdfdf")
//                .alignmentGuide(.leading, computeValue: { d in return 0 })
//                .alignmentGuide(.trailing, computeValue: { d in return 0 })
//                .background(Color.purple)
//                .lineLimit(2)
//
//        }
//        .background(Color.orange)
//    }
    
    @State private var alignment: HorizontalAlignment = .center
       
       var body: some View {
           VStack {
               Spacer()
               
                VStack(alignment: alignment) {
                
                    LabelView(title:"Athos", color:.green)
                   .alignmentGuide(.leading, computeValue: { _ in 30 } )
                      .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 50 } )
                      .alignmentGuide(.trailing, computeValue: { _ in 90 } )
                    
                    LabelView(title: "Porthos", color: .red)
                      .alignmentGuide(.leading, computeValue: { _ in 90 } )
                      .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } )
                      .alignmentGuide(.trailing, computeValue: { _ in 30 } )
                    
                    LabelView(title: "Aramis", color: .blue) // use implicit guide
                   
                }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                .border(Color.black, width: 2)

               Spacer()
               HStack {
                   Button("leading") { withAnimation(.easeInOut(duration: 2)) { self.alignment = .leading }}
                   Button("center") { withAnimation(.easeInOut(duration: 2)) { self.alignment = .center }}
                   Button("trailing") { withAnimation(.easeInOut(duration: 2)) { self.alignment = .trailing }}
               }
           }
       }
}

struct testAlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        testAlignmentGuide()
    }
}
