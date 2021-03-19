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

//        IndexView()
        SearchView()

    }

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
