//
//  ZQRefreshableKey.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/23.
//

import SwiftUI
import Foundation

struct RefreshableKey {
  enum ViewType: Int {
    case movingView
    case fixedView
    case contentView
  }
  
  struct PrefData: Equatable {
    let vType: ViewType
    var bounds: CGRect
  }
  
  struct PrefKey: PreferenceKey {
    typealias Value = [PrefData]
    static var defaultValue: [PrefData] = []
    
    static func reduce(
      value: inout [RefreshableKey.PrefData],
      nextValue: () -> [RefreshableKey.PrefData]) {
      value.append(contentsOf: nextValue())
    }
  }
  
  struct ContentPrefData {
    let vType: ViewType
    let bounds: Anchor<CGRect>
  }
  
  struct ContentPrefKey: PreferenceKey {
    typealias Value = [ContentPrefData]
    static var defaultValue: [ContentPrefData] = []
    
    static func reduce(
      value: inout [RefreshableKey.ContentPrefData],
      nextValue: () -> [RefreshableKey.ContentPrefData]) {
      value.append(contentsOf: nextValue())
    }
  }
}
