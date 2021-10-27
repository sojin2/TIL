# Property

쉽게 말하자면, 값을 저장하기 위한 목적으로 클래스와 구조체 내에서 정의된 변수나 상수

정확한 역할 : 값을 제공

프로퍼티 중 일부는 값을 저장하지는 않지만 값을 제공하는 특성을 가지고 있음

종류

저장 프로퍼티

- 입력된 값을 저장하거나 저장된 값을 제공하는 역학
- 상수 및 변수를 사용해서 정의 가능
- 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없음

연산 프로퍼티

- 특정 연산을 통해 값을 만들어 제공하는 역할
- 변수만 사용해서 정의 가능
- 클래스, 구조체, 열거형 모두에서 사용 가능

인스턴스 프로퍼티 : 인스턴스에 소속되는 프로퍼티

타입 프로퍼티: 클래스와 구조체 자체에 소속되어 값을 가짐

역활에 따른 분류

- 저장 프로퍼티(Stored Property)
- 연산 프로퍼티(Computed Property)

소속에 따른 분류

- 인스턴스 프로퍼티 (Instance Property)
- 타입 프로퍼티 (Type Property)

정의 위치

클래스 정의 구문 내부에 작성 

메소드 내부에 작성되면 안 됨

—> 메소드 내에서도 변수나 상수를 사용하여 값을 저장할 수 있는데, 이것은 프로퍼티가 아니라 지역 변수에 불과

즉, 클래스의 내부에, 메소드의 외부에 정의

---

프로퍼티 옵저버 (Property Observer)

: 프로퍼티 값을 모니터링하기 위해

- 사용자가 정의한 특정 액션과 반응하도록 처리할 수 있습니다.
- 우리가 직접 정의한 저장 프로퍼티에 추가할 수 있으며, 슈퍼 클래스로부터 상속 받은 서브 클래스에서도 추가할 수 있습니다.

---

저장 프로퍼티 (Stored Property)

- 속성 변수
- 속성 상수

초기값 할당

반드시 선언하는 시점에서 초기값을 할당해야 하는 것은 아님, 초기화 구문에서 초기 값을 설정해도됩니다.

클래스에서 프로퍼티 할당

1. 초기화 구문을 작성하고, 그 안에서 초기 값을 할당해 줍니다.

```swift
class User {
    var name: String

    init() {
        self.name = ""
    }
}
```

init 메소드는 일반적인 메소드와 달리 직접 호출되기보다는 인스턴스가 생성될 때 간접적으로 호출되는 경우가 대부분입니다. init 메소드 내부에 작성된 구문은 인스턴스가 생성될 때 실행됩니다.

self 키워드는 멤버 변수나 메소드 앞에 붙여서 구분해주는게 좋습니다.

1. 프로퍼티를 옵셔널 타입으로 바꿔 줍니다.

```swift
class User {
    var name: String?
}
(또는)
class User {
    var name: String!
}
```

옵셔널 타입으로 선언할 경우, 초기화 하지 않았더라도 시스템이 자동으로 초기화해주므로 문제가 생기지 않습니다.

1. 프로퍼티에 초기 값을 할당해 줍니다. 

```swift
class User {
    var name: String = ""
}
```

빈 초기 값을 입력해주면 많은 문제로부터 벗어날 수 있습니다.

---

저장 프로퍼티의 분류

- var 키워드로 정의되는 변수형 저장 프로퍼티 = 멤버 변수
    - 수정  가능
- let 키워드로 정의되는 상수형 저장 프로퍼티 = 멤버 상수
    - 수정 불가능
    

```swift
// 고정 길이 범위 구조체
struct FixedLengthRange {
    var startValue: Int // 시작 값
    let length: Int // 값의 범위
}

var rangeOfFiexedIntegers = FixedLengthRange(startValue: 0, length: 5) // 0,1,2,3,4
rangeOfFiexedIntegers.startValue = 3 // 3,4,5,6,7

// 가변 길이 범위 구조체
struct FiexibleLengthRange {
    let startVlaue: Int
    var length: Int
}

var rangeOfFlexibleLengthRanges = FiexibleLengthRange(startVlaue: 0, length: 4) // 0,1,2,3
rangeOfFlexibleLengthRanges.length = 6 //0,1,2,3,4,5

// 변수 할당
var variablesOfInstance = FixedLengthRange(startValue: 3, length: 4)
variablesOfInstance.startValue = 0 // (o)

// 상수 할당
let constantsOfInstance = FixedLengthRange(startValue: 3, length: 4)
constantsOfInstance.startValue = 0 // (x)
```

반면 클래스는 적용되지 않음

클래스 인스턴스를 상수에 할당하더라도 클래스 내에서 변수로 선언한 저장 프로퍼티는 얼마든지 값을 수정할 수 있다

이유는?

구조체는 값에 의한 전달 방식

클래스는 참조에 의한 전달 방식 이라서

따라서 구조체는 저장 프로퍼티의 값이 바뀌면 상수에 할당된 인스턴스 전체가 변경되고, 

클래스는 저장 프로퍼티의 값이 바뀌더라도 상수에 할당된 인스턴스의 레퍼런스는 변경되지 않음

---

지연 저장 프로퍼티

일반적으로 저장 프로퍼티는 클래스 인스턴스가 처음 생성될 때 함께 초기화되지만, 저장 프로퍼티 정의 앞에 lazy라는 키워드가 붙으면 예외입니다.

이 키워드는 저장 프로퍼티의 초기화를 지연시킵니다.

클래스 인스턴스가 생성되어 모든 저장 프로퍼티가 만들어지더라도 lazy 키워드가 붙은 프로퍼티는 선언만 될 뿐 초기화되지 않고 계속 대기하고 있다가 프로퍼티가 호출되는 순간에 초기화됩니다.

이처럼 호출되기 전에는 선언만 된 상태로 대기하다가 실제로 호출되는 시점에서 초기화가 이루어지는 저장 프로퍼티를 지연 저장 프로퍼티라고 합니다.

```swift
class OnCreate {
    init() {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test")
    }
}
```
