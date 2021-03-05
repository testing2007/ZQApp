//
//  CircleImage.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/1.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("logo-cicle-corner").clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
