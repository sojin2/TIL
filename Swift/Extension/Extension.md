# Extension
이미 존재하는 클래스나 구조체, 열거형 객체 혹은 프로토콜 타입에 새로운 기능을  추가하여 확장해주는 구문입니다.

### **스위프트에서 익스텐션을 통해 구현할 수 있는 것**

1. 새로운 **연산 프로퍼티**를 추가 (인스턴스 프로퍼티 or 타입 프로퍼티)

2. 새로운 **메소드**를 정의 (인스턴스 메소드 or 타입 메소드)

3. 새로운 **이니셜라이저(초기화 구문)**을 추가

4. **중첩 타입**의 선언과 사용

5. 특정 **프로토콜을 따르는** 타입만들기

---

## **구현**

```swift
extension String {
/* 타입에 추가될 새로운 기능 구현*/
}

//익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장할 수도 있습니다.
extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3... {
/* 프로토콜 요구사항 구현*/
}
```

## **Computed Properties (연산 프로퍼티)**

익스텐션을 이용하면 기존 객체에 연산 프로퍼티를 추가할 수 있습니다.

저장 프로퍼티는 추가가 불가능하지만, 인스턴스 프로퍼티, 타입 프로퍼티들이 연산 프로퍼티라면 모두 추가할 수 있습니다.

익스텐션을 이용해 존재하는 타입에 계산된 인스턴스 프로퍼티와 타입 프로퍼티를 추가할 수 있습니다.

```swift
extension Double {
    var km: Double { return self 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm

print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"let threeFeet = 3.ft

print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"let aMarathon = 42.km + 195.m

print("A marathon is \(aMarathon) meters long")
// Prints "A marathon is 42195.0 meters long"
```

익스텐션은 새 계산된 값을 추가할 수 있지만 새로 저장된 프로퍼티나 프로퍼티 옵저버를 추가할 수는 없습니다.

## **lnitializers (초기화 구문)**

커스텀 타입의 이니셜라이저 파라미터를 넣을 수 있도록 변경하거나 원래 구현에서 포함하지 않는 초기화 정보를 추가할 수 있습니다.

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
   size: Size(width: 5.0, height: 5.0))

// 추가적인 이니셜라이저 제공을 위해 확장extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
```

익스텐션에서 이니셜라이저를 제공할 때 각 인스턴스가 이니셜라이저가 한번 완료되면 완전히 초기화 되도록 확실히 해야합니다.

## **Methods 메소드**

기존 객체에 새로운 인스턴스나 메소드, 타입 메소드를 추가할 수 있습니다.

메소드 오버로딩 특성을 이용해서 새로운 메소드를 정의 (매개변수 타입을 달리하면 서로 다른 메소드) O

매개변수명을 변경하여 새로운 메소드를 작성 O

But

기존 객체에서 사용된 같은 메소드를 익스텐션에서 재정의하는 것 X

왜? 오버라이딩이라 클래스 객체에서 상속으로만 할 수 있는 기능임

```
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
// Hello!// Hello!// Hello!
```

## **Mutating Instance Methods**

mutating 키워드를 사용하여 인스턴스 자신을 수정하도록 허용할 수 있음

익스텐션에서 추가된 인스턴스 메소드는 인스턴스 자신(self)을 변경할 수 있습니다.

구조체와 열거형 메소드 중 자기 자신(self)를 변경하는 인스턴스 메소드는 원본 구현 mutating 메소드와 같이 반드시 mutating으로 선언돼야합니다.

```
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9
```

## **Subscripts**

익스텐션을 이용해 존재하는 타입에 새로운 서브스크립트를 추가할 수 있습니다

```
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
// 10 * n번째 수로 현재 수를 나눈 것의 나머지// 1인 경우 746381295 % 10 -> 5가 나머지// 2인 경우 746381295 % 10 -> 9가 나머지
    }
}
746381295[0]
// returns 5746381295[1]
// returns 9746381295[2]
// returns 2746381295[8]
// returns 7746381295[9]
// 9로 처리할 수 있는 자릿 수를 넘어가면 0을 반환0746381295[9]
```

## **Nested Types (중첩 타입)**

익스텐션을 이용해 존재하는 클래스, 구조체, 열거형에 중첩 타입을 추가할 수 있습니다.

```swift
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

// 특정 수가 음수, 0, 양수 중 어떤 것인지를 나타내는 예제func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Prints "+ + - 0 - 0 + "
```

## **장점**

- 익스텐션을 사용하면 직접 소스 코드를 수정할 수 없는 라이브러리나 스위프트 언어 기반을 이루는 객체들까지 모두 확장할 수 있다
- 한번 작성해 놓은 스위프트 코드들은 라이브러리화한 상태에서 추가해야 할 사항이 생겼을 때 익스텐션을 사용한다면 매우 간단하게 처리할 수 있다.

## **단점**

- 익스텐션을 남용하면 객체의 정의를 모호하게 만들거나 각 실행 위치에 따라 서로 다른 정의로 구성된 객체를 사용하게 만드는 결과를 가져올 수도 있습니다.
- 어느 위치에서는 익스텐션의 영향을 받지 않아 추가된 프로퍼티나 메소드들이 제공되는데, 또 다른 위치에서는 익스텐션의 영향을 받지 않아 추가된 프로퍼티나 메소드들을 전혀 사용할 수 없는 경우가 생길 수 있기 때문입니다.
- 객체의 정의가 파편화되기 쉬운 까닭에 객체의 정확한 구성을 파악하기 어렵습니다.
