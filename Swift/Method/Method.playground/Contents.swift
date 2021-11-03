import UIKit

struct Resolution {
    var width = 0
    var height = 0


// 구조체의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() ->  String {
        let desc = "이 해상도는 가로 \(self.width) X \(self.height)로 구성됩니다."
        return desc
    }
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?


    // 클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}

var res = Resolution()
res.width

class Counter {
    var count = 0
    
    func increment() {
        self.count += 1
    }
    
    func incrementBy(amount: Int) {
        self.count += amount
    }
    
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(amount: 5)
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var point = Point(x: 10.5, y:12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다.")

class Location {
    var x = 0.0, y = 0.0
    
    func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var loc = Location()
loc.x = 10.5
loc.y = 12.0
loc.moveByX(x: 3.0, y: 4.5)

print("이제 새로운 좌표는 (\(loc.x), \(loc.y)) 입니다.")


class Foo {
    class func fooTypeMethod() {
        // 코드
    }
}

let f = Foo()
f.fooTypeMethod() // Error
Foo.fooTypeMethod()
