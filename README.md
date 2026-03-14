# Swift 结构体 Demo

## 简介

展示 Swift 结构体的创建、计算属性、方法。

## 启动和使用

```bash
cd swift-struct-demo
swift run
```

## 教程

### 结构体特点

- 值类型：赋值时复制
- 自动生成成员逐一构造器
- 使用 `mutating` 关键字修改属性

### 计算属性

```swift
var area: Double {
    return width * height
}
```

### 静态成员

使用 `static` 关键字
