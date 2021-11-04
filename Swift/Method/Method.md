# Method

일종의 함수로서, 클래스나 구조체, 열거형과 같은 객체 내에서 함수가 선언될 경우를 말합니다.

즉, 특정 타입의 객체 내부에서 사용하는 함수라고 할 수 있습니다.

### 함수와 메소드의 차이점?

1. 독립성 - 함수는 독립적인 기능을 구현하기 위해 만들어짐
2. 연관성 - 하나의 객체 내에 정의된 다른 메소드들과 서로 협력하여 함수적인 기능 수행

종류

1. **Instance Method (인스턴스 메소드)**
    - 객체의 인스턴스를 생성해야 사용할 수 있는 메소드
    - 주어진 객체의 인스턴스와 함께 특수한 임무나 함수적인 기능을 수행하도록 캡슐화된 메소드
    - 틀을 이용하여 만들어낸 구체적이고 실질적인 것에 관련된 메소드
    - 객체 타입 자체로 호출 X, 반드시 인스턴스를 생성한 후에야 호출 가능
    
2. **Type Method (타입 메소드)**
    - 객체의 인스턴스를 생성하지 않아도 사용할 수 있는 메소드
    - 객체 타입 자체에 관련된 메소드
    - 원형이나 틀에 관련된 메소드
    - 객체 타입 상태에서도 호출 O

---

# Instance Method (인스턴스 메소드)

클래스, 구조체 또는 열거형과 같은 객체 타입이 만들어내는 인스턴스에 소속된 함수

### 기능

- 인스턴스 프로퍼티에 접근하거나 수정하는 방법 제공
- 인스턴스 생성 목적에 따른 함수적 관계성 제공
- 인스턴스 없이 독립적인 호출이 불가능 합니다.

```swift
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
```

인스턴스 메소드 내에서 프로퍼티를 읽어올 경우 self 키워드를 사용합니다.

### Mutating 키워드 (클래스는 사용 X)

내부 프로퍼티의 값을 수정할 때는 반드시 mutating 키워드를 사용하여 내부 프로퍼티를 수정합니다.

구조체나 열거형 인스턴스를 상수로 할당 받으면 mutating 메소드를 호출 할 수 없습니다.

```swift
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
```

클래스는 클래스에 정의된 모든 인스턴스 메소드는 인스턴스 내의 프로퍼티를 원하는 대로 수정할 수 있습니다.

```swift
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
```

---

# Type Method (타입 메소드)

인스턴스를 생성하지 않고 클래스나 구조체 자체에서 호출할 수 있는 메소드

선언 방법

- static
- 하위 클래스에서 재정의 가능한 타입 메소드를 선언할때 class 키워드 사용 —> 클래스 타입에서만 사용

```swift
class Foo {
    class func fooTypeMethod() {
        // 코드
    }
}

let f = Foo()
f.fooTypeMethod() // Error
Foo.fooTypeMethod()
```

### Extension (확장)

```swift
struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20) //20

// extension 확장 (제곱, 반값)
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.square(value: 3) // 9
Math.square(value: 10) // 100

let value: Int = 3

// Swift에 저장되어있는 구조체도 확장 가능 (제곱, 반값)
extension Int {
    func square() -> Int {
        return self * self
    }
    func half() -> Int {
        return self / 2
    }
}

value.square()
value.half()
```
