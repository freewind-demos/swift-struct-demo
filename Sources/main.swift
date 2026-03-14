// swift-struct-demo.swift

// ============ 基本结构体 ============
struct Person {
    var name: String
    var age: Int
}

var person = Person(name: "Tom", age: 25)
print("姓名: \(person.name), 年龄: \(person.age)")

// 修改属性
person.age = 26
print("修改后: \(person.age)")

// ============ 成员逐一构造器 ============
let person2 = Person(name: "Jerry", age: 30)
print("person2: \(person2)")

// ============ 结构体作为值类型 ============
struct Point {
    var x: Double
    var y: Double
}

var p1 = Point(x: 1.0, y: 2.0)
var p2 = p1  // 复制一份
p2.x = 10.0
print("p1.x = \(p1.x)")  // 不受 p2 影响
print("p2.x = \(p2.x)")

// ============ 计算属性 ============
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

// ============ 方法 ============
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

// ============ 静态属性和方法 ============
struct MathUtils {
    static let pi = 3.14159

    static func square(_ x: Int) -> Int {
        return x * x
    }
}
print("π: \(MathUtils.pi)")
print("5的平方: \(MathUtils.square(5))")
