//
//  ContentView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/1.
//

import SwiftUI

var someCondition: Bool = false

struct ContentView: View {
    
    var body: some View {
        IndexView()
//        Text("test")
//        return VStack(){
//            MapView()
//                .frame( height: 300)
//                .ignoresSafeArea(edges: .top)
//
//            CircleImage().offset(y: -50)
//                .padding(.bottom, -30)
//
//            VStack(alignment: .leading){
//                Text("Turtle Rock").font(.title)
//                HStack {
//                    Text("PlaceholderP rPlaceholder")
//                    Spacer()
//                    Text("Cannda")
//                }
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//
//                Divider()
//
//                Text("PlaceholderP rPlaceholder").font(.title)
//                Text("Cannda")
//
//            }.padding()
//
//            Spacer()
//        }
    }
    //    var body: some View {
    //        return VStack(alignment: .leading) {
    //            ExtractedView()
    //        }
    //    }
    //
    //    var body: some View {
    //        Image("turtlerock")
    //             .clipShape(Circle())
    //             .overlay(
    //                 Circle().stroke(Color.white, lineWidth: 4))
    //             .shadow(radius: 10)
    //    }
    
    //    var body: some View {
    //        List{
    //            LandmarkRow(landmark: landmark)
    //        }
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var body: some View {
        Text("Turtle Rock").font(.title).fontWeight(.bold).foregroundColor(.blue).multilineTextAlignment(.leading)
    }
}
