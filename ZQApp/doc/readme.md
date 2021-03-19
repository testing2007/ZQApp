

#### 基础MVVM代码架构设计思想
[简单文章](https://www.debugcn.com/article/53269272.html)
[巧妙设计](https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/) -- 代码最终使用
[UI](https://www.swiftbysundell.com/tips/optional-swiftui-views/)
[样式封装](https://www.swiftbysundell.com/articles/encapsulating-swiftui-view-styles/)
[常见swiftUI控件使用](https://www.ctolib.com/Jinxiansen-SwiftUI.html)
[swiftUI特性说明](https://blog.csdn.net/ctrip_tech/article/details/101041680)

#### 工具类
[分页加载](https://juejin.cn/post/6844903616680034318)

#### 对齐
##### view的对齐 alignmentGuide 与 容器对齐（HStack/VStack/ZStack）alignment
```swift
@State private var alignment: HorizontalAlignment = .trailing //只有与容器对齐设置的方式一样的view，该设置才生效

VStack(alignment: alignment) {

    LabelView(title:"Athos", color:.green)
   .alignmentGuide(.leading, computeValue: { _ in 30 } ) //view.leading 与 VStack.trailing 不一致，该设置不生效
      .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 50 } ) //不生效
      .alignmentGuide(.trailing, computeValue: { _ in 20 } ) //view.trailing 与 VStack.trailing 一致，该设置生效
    
    LabelView(title: "Porthos", color: .red)
      .alignmentGuide(.leading, computeValue: { _ in 0 } ) //不生效
      .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } ) //不生效
      .alignmentGuide(.trailing, computeValue: { _ in 20 } ) //生效
    
    LabelView(title: "Aramis", color: .blue) // use implicit guide
   
}
```
##### 容器对齐 alignment
###### VStack--对应水平对齐（3中方式）
extension HorizontalAlignment {

    /// A guide marking the leading edge of the view.
    public static let leading: HorizontalAlignment

    /// A guide marking the horizontal center of the view.
    public static let center: HorizontalAlignment

    /// A guide marking the trailing edge of the view.
    public static let trailing: HorizontalAlignment
}
###### HStack--对应垂直对齐（5种方式）
extension VerticalAlignment {

    /// A guide marking the top edge of the view.
    public static let top: VerticalAlignment

    /// A guide marking the vertical center of the view.
    public static let center: VerticalAlignment

    /// A guide marking the bottom edge of the view.
    public static let bottom: VerticalAlignment

    /// A guide marking the topmost text baseline view.
    public static let firstTextBaseline: VerticalAlignment

    /// A guide marking the bottom-most text baseline in a view.
    public static let lastTextBaseline: VerticalAlignment
}

###### ZStack--对应垂直对齐 （9个方向）
@frozen public struct Alignment : Equatable {

    /// A guide marking the center of the view.
    public static let center: Alignment

    /// A guide marking the leading edge of the view.
    public static let leading: Alignment

    /// A guide marking the trailing edge of the view.
    public static let trailing: Alignment

    /// A guide marking the top edge of the view.
    public static let top: Alignment

    /// A guide marking the bottom edge of the view.
    public static let bottom: Alignment

    /// A guide marking the top and leading edges of the view.
    public static let topLeading: Alignment

    /// A guide marking the top and trailing edges of the view.
    public static let topTrailing: Alignment

    /// A guide marking the bottom and leading edges of the view.
    public static let bottomLeading: Alignment

    /// A guide marking the bottom and trailing edges of the view.
    public static let bottomTrailing: Alignment
}
