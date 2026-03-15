# Swift 结构体 Demo

## 简介

本 demo 展示 Swift 结构体的创建、计算属性、方法。结构体是 Swift 中非常重要的数据类型，特别适合表示**值类型**的数据。

## 基本原理

### 什么是结构体？

结构体（struct）是 Swift 中的**值类型**，和类非常相似，可以定义属性、方法、构造器、下标等。

```swift
struct Person {
    var name: String
    var age: Int
}
```

### 值类型 vs 引用类型

**结构体是值类型**：

```swift
struct Point {
    var x: Double
    var y: Double
}

var p1 = Point(x: 1.0, y: 2.0)
var p2 = p1  // 复制一份
p2.x = 10.0

print("p1.x = \(p1.x)")  // 输出: 1.0
print("p2.x = \(p2.x)")  // 输出: 10.0
```

**类是引用类型**：

```swift
class PointClass {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

var p1 = PointClass(x: 1.0, y: 2.0)
var p2 = p1  // 共享同一个对象
p2.x = 10.0

print("p1.x = \(p1.x)")  // 输出: 10.0（因为指向同一个对象）
print("p2.x = \(p2.x)")  // 输出: 10.0
```

### 结构体的优势

| 优势 | 说明 |
|------|------|
| **值语义** | 赋值时复制，避免意外的共享状态 |
| **线程安全** | 多个线程访问时不需要同步 |
| **性能** | 栈上分配，不需要 ARC 开销 |
| **不可变性** | 用 let 声明的 struct 默认不可变 |

---

## 启动和使用

### 环境要求

- Swift 5.0+
- macOS 或 Linux

### 安装和运行

```bash
cd swift-struct-demo
swift run
---

## 教程

### 基本结构体

```swift
struct Person {
    var name: String
    var age: Int
}

var person = Person(name: "Tom", age: 25)
print("姓名: \(person.name), 年龄: \(person.age)")

person.age = 26
print("修改后: \(person.age)")
```

### 自动生成的构造器

结构体会自动生成**成员逐一构造器**：

```swift
let person2 = Person(name: "Jerry", age: 30)
print("person2: \(person2)")
```

编译器自动生成：
```swift
init(name: String, age: Int) {
    self.name = name
    self.age = age
}
```

### mutating 方法

结构体的方法默认不能修改属性，需要用 `mutating` 关键字：

```swift
struct Counter {
    var count = 0

    mutating func increment() {
        count += 1
    }

    mutating func reset() {
        count = 0
    }
}

var counter = Counter()
counter.increment()
counter.increment()
print("计数: \(counter.count)")
counter.reset()
print("重置后: \(counter.count)")
```

### 计算属性

结构体可以有计算属性：

```swift
struct Rectangle {
    var width: Double
    var height: Double

    var area: Double {
        return width * height
    }

    var perimeter: Double {
        return 2 * (width + height)
    }
}

let rect = Rectangle(width: 10, height: 5)
print("矩形面积: \(rect.area)")
print("矩形周长: \(rect.perimeter)")
```

### 静态成员

结构体可以有静态属性和方法：

```swift
struct MathUtils {
    static let pi = 3.14159

    static func square(_ x: Int) -> Int {
        return x * x
    }
}
print("π: \(MathUtils.pi)")
print("5的平方: \(MathUtils.square(5))")
```

---

## 关键代码详解

### 值类型的复制机制

Swift 对值类型的复制采用了**写时复制（Copy-on-Write）**策略：

```swift
var p1 = Point(x: 1.0, y: 2.0)
var p2 = p1  // 此时 p1 和 p2 共享底层数据

p2.x = 10.0  // 只有在修改时才会真正复制
```

Swift 优化了复制操作，只有在真正需要修改时才会复制数据，提高了性能。

### mutating 的原理

```swift
mutating func increment() {
    count += 1
}
```

`mutating` 告诉编译器：这个方法会修改 self，需要创建新的副本。

---

## 总结

结构体是 Swift 的核心特性：

1. **值语义** — 赋值时复制，避免共享状态问题
2. **自动生成代码** — 构造器、下标等自动生成
3. **线程安全** — 不需要同步机制
4. **mutating** — 需要显式标记修改属性的方法

什么时候用结构体：
- 简单数据模型（Point、Rect）
- 不需要继承
- 需要值语义
- 追求不可变性

什么时候用类：
- 需要继承
- 需要引用语义
- 需要生命周期管理
- 需要析构器
