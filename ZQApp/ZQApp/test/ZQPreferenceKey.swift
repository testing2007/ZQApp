//
//  ZQPreferenceKey.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/23.
//

import SwiftUI

struct TagPreferenceData {
    let bounds: Anchor<CGRect>
}

struct TagPreferenceKey: PreferenceKey {
    typealias Value = [TagPreferenceData]
    
    static var defaultValue: [TagPreferenceData] = []
    
    static func reduce(
        value: inout [TagPreferenceData],
        nextValue: () -> [TagPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}



struct ZQPreferenceKey: View {
    var body: some View {
        Text("Hello, World!")
            .padding(20)
            //            extension View {
            //                @inlinable public func anchorPreference<A, K>(
            //                    key _: K.Type = K.self,
            //                    value: Anchor<A>.Source,
            //                    transform: @escaping (Anchor<A>) -> K.Value) -> some View where K : PreferenceKey
            //            }
            
            .anchorPreference(
                key: TagPreferenceKey.self,//保存数据用的名字
                value: .bounds, //保存数据的类型
                transform: { anchor in
                    //anchor - Anchor<CGRect>
                    //k.value - TagPreferenceKey.Value - [TagPreferenceData]
                    return [TagPreferenceData(bounds: anchor)]
                })
            .backgroundPreferenceValue(TagPreferenceKey.self) { preferences in
                return GeometryReader { proxy in
                    return self.createBackground(proxy, preferences)
                }
            }
        
        //            .anchorPreference(
        //                key: TagPreferenceKey.self,
        //                value: .bounds,
        //                transform: { [TagPreferenceData(bounds: $0)] }
        //            )
        
    }
    
    func createBackground(
        _ geometry: GeometryProxy,
        _ preferences: [TagPreferenceData]) -> some View {
        let p = preferences.first
        let bounds = p != nil ? geometry[p!.bounds] : .zero
        
        print(bounds)
        return Color.orange
    }
}

struct ZQPreferenceKey_Previews: PreviewProvider {
    static var previews: some View {
        ZQPreferenceKey()
    }
}
