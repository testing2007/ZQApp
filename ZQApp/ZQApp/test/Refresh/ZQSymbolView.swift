//
//  ZQSymbolView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/23.
//

import Foundation
import SwiftUI

struct ZQSymbolContent : View {
    var height: CGFloat
    var loading: Bool
    var frozen: Bool
    var rotation: Angle
    
    var body: some View {
      Group {
        if loading {
          VStack {
            Spacer()
            ActivityIndicator()
            Spacer()
          }
          .frame(height: height).fixedSize()
          .offset(y: -height + (loading && frozen ? height : 0))
        }
        else {
          Image(systemName: "arrow.down")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: height * 0.25, height: height*0.25).fixedSize()
            .padding(height * 0.375)
            .rotationEffect(rotation)
            .offset(y: -height + (loading && frozen ? height : 0))
        }
      }
    }
}

//struct ZQSymbolContent_Previews: PreviewProvider {
//    static var previews: some View {
//        ZQSymbolContent()
//    }
//}



