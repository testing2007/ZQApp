//
//  ZQActivityIndicator.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/23.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

  func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    return UIActivityIndicatorView()
  }

  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    uiView.startAnimating()
  }
}

//struct ZQActivityIndicator: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ZQActivityIndicator_Previews: PreviewProvider {
//    static var previews: some View {
//        ZQActivityIndicator()
//    }
//}
