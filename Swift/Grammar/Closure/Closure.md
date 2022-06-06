## **Closures**

자신이 정의되었던 문맥으로부터 모든 상수와 변수의 **값을 캡쳐**하거나 **레퍼런스를 저장**하는 **익명함수**라고 할 수 있습니다.

Swift에서 클로저라고 부르는 객체

1. 전역 함수 : 이름 O, 주변 환경에서 캡처할 어떤 값도 없는 클로저
2. 중첩 함수: 이름 O, 자신을 둘러싼 함수로부터 값을 캡처할 수 있는 클로저
3. 클로저 표현식: 이름 X, 주변 환경으로부터 값을 캡쳐할 수 있는 경량 문법으로 작선된 클로저

Swift에서 클로저 표현의 최적화 

- 문맥에서 인자(parameter type)과 반환 타입(return type)의 추론
- 단일 표현 클로저에서의 암시적 반환
- 축약된 인자 이름
- 후위 클로저 문법

---

## **클로저의 표현식**

```
{ (매개변수) -> 반환 타입 in
    실행할 구문
}
```

```
// () 빈 괄호 사용
{() -> () in
    print("클로저가 실행됩니다.")
}

// Void 사용
{() -> Void in
    print("클로저가 실행됩니다.")
}
```

---

### **직접 실행하는 방법**

: 보통은 인자 값으로 함수를 넘겨주어야 할 때 사용

1. 상수나 변수에 클로저 표현식을 할당한 다음 실행

```
let f = { () -> Void in
    print("클로저가 실행됩니다.")
}
f()
```

2. 클로저 표현식을 할당하지 않고 실행

```
({ () -> Void in
    print("클로저가 실행됩니다.")
})()
```

매개 변수 O, 반환값 X

```
let c = { (s1: Int, s2: String) -> Void in
    print("s1: \(s1), s2: \(s2)")
}
c(1,"closure")

// 또는
({ (s1: Int, s2: String) -> Void in
    print("s1: \(s1), s2: \(s2)")
})(1, "closure")
```

---

### **경량 문법**

먼저 예시 코드를 작성해보겠습니다.

```
var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}

value.sort(by: order)
```

위의 함수를 클로저 표현식으로 바꾸면 아래 예시와 같습니다.

```
value.sorted(by: {
        (s1: Int, s2: Int) -> Bool in
        if s1 > s2 {
            return true
        } else {
            return false
        }
})

value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    return s1 > s2
})

value.sort (by: {(s1: Int, s2: Int) -> Bool in return s1 > s2})

value.sort(by: {(s1: Int, s2: Int) in return s1 > s2})

value.sort(by: {s1, s2 in return s1 > s2})

value.sort(by: { $0 > $1 })

value.sort(by: > )
```

---

## **Trailing Closure (트레일링 클로저)**

: 함수의 마지막 인자 값이 클로저일 때, 이를 인자값 형식으로 작성하는 대신 함수의 뒤에 꼬리처럼 붙일 수 있는 문법을 의미합니다. 

이때, 인자레이블은 생략됩니다 (= 클로저 꼬리)

주의할 점 

:  함수의 마지막 인자 값에만 적용

```
value.sort() { (s1, s2) in
    return s1 > s2
}

func divide(base: Int, success s: () -> Void) -> Int {
    defer {
        s()//성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 100) { () in
    print("연산이 성공했습니다.")

}

func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f()//실패 함수를 실행한다.return 0
    }

    defer {
        s()//성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 100, success: { () in
    print("연산이 성공했습니다.")
}) { () in
    print("연산에 실패하였습니다.")
}

// 허용 안 됨//divide(base: 100 { () in//    print("연산에 성공했습니다.")//} { () in//    print("연산에 실패했습니다.")//}
```

---

## **속성**

### **@escaping**

: 인자 값으로 전달된 클로저를 저장해 두었다가, 나중에 다른 곳에서도 실행 할 수 있도록 허용해주는 속성

```swift
func callback(fn: () -> Void) {
    fn()
}

callback {
    print("Closure가 실행되었습니다.")
}
 // "Closure가 실행되었습니다."

```

오류 

```swift
// 오류- 함수 내부라 할지라도 변수나 상수에 대입할 수 없습니다.
func callback(fn: () -> Void) {
    let f = fn
    f()
}
```

Non-escaping 파라미터인 'fn'은 오직 직접 호출하는 것만 가능합니다.

Swift에서 함수의 인자 값으로 전달된 클로저는 기본적으로 탈출 불가(non-escape) 의 성격을 가집니다.

클로저는

1. 함수 내에서

2. 직접 실행을 위해서만 사용

해야하는 것을 의미하며, 이 때문에 함수 내부라 할지라도 변수나 상수에 대입할 수 없습니다.

변수나 상수에 대입하는 것을 허용한다면 내부 함수를 통한 캡처 기능을 이용하여 클로저가 함수 바깥으로 탈출할 수 있기 때문입니다.

여기서 말하는 탈출이란, 함수 내부 범위를 벗어나서 실행되는 것ㄱ을 의미합니다.

```
func callback(fn: () -> Void) {
    func innerCallback() {
        fn()
    }

}func callback(fn: @escaping () -> Void) {
    let f = fn
 // 클로저를 상수 f에 대입

    f()
 //대입된 클로저를 실행
}

callback {
    print("Closure가 실행되었습니다.")
}
"Closure가 실행되었습니다."
```

### **@autoclosure**

: 인자 값으로 전달된 일반 구문이나 함수 등을 클로저로 래핑(Wrapping)하는 역할을 합니다. 쉽게 말해 이 속성이 붙어 있을 경우, 일반 구문을 인자 값으로 넣더라도 컴파일러가 알아서 클로저로 만들어서 사용한다는 거죠

이 속성을 적용하면 인자값을 '{}' 형태가 아니라 '()' 형태로 사용할 수 있다는 장점이 있습니다.

인자 값을 직접 클로저 형식으로 넣어줄 필요가 없기 때문입니다. 이는 코드를 조금 더 이해하기 쉬운 형태로 만들어 줍니다.

```
//@autoclosure//함수 정의func condition(stmt: () -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}

// 실행 방법 1: 일반 구문
condition(stmt: {
    4 > 2
})

// 실행 방법 2: 클로저 구문
condition(stmt: {
    4 > 2
})

// STEP 1 : 경향화되지 않은 클로저 전체 구문
condition { () -> Bool in
    return (4 > 2)
}

// STEP 2: 클로저 타입 선언 생략
condition {
    return (4 > 2)
}

// STEP 3: 클로저 반환구문 생략
condition {
    4 > 2
}

func condition(stmt: @autoclosure() -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}

// 실행 방법
condition(stmt: ( 4 > 2 ))
```

**지연된 실행**

원래 구문은 작성하는 순간에 실행되는 것이 맞지만 함수 내에 작성된 구문은 함수가 실행되기 전까지는 실행되지 않습니다.

@autoclosure 속성이 부여된 인자 값은 보기엔 일반 구문 형태이지만 컴파일러에 의해 클로저, 즉 함수로 감싸지기 때문에 위와 같이 작성해도 addVars(fn:) 함수 실행전까지는 실행되지 않으며, 해당 구문이 실행될 때에는 이미 배열의 인덱스가 확장된 후이므로 오류도 발생하지 않는 겂니다.

```
// 빈 배열 정의var arrs = [String]()

func addVars(fn: @autoclosure () -> Void) {
// 배열 요소를 3개까지 추가하여 초기화
    arrs = Array(repeating: "", count: 3)
// 인자 값으로 전달된 클로저 실행
    fn()
}

// 구문 1: 아래 구문은 오류가 발생한다.
arrs.insert("KR", at: 1)

// 구문 2: 아래 구문은 오류가 발생하지 않는다.
addVars(fn: arrs.insert("KR", at: 1))
```

정리해보면,

@autoclosure 속성이 인자값에 부여되면 해당 인자 값은 컴파일러에 의해 클로저로 자동 래핑됩니다.

이 때문에 함수를 실행할 때에는 '{}' 형식의 클로저가 아니라 '()' 형식의 일반 값을 인자 값으로 사용해야 합니다.

또한 인자값은 코드에 작성된 시점이 아니라 해당 클로저가 실행되는 시점에 맞추어 실행됩니다.

이를 지연된 실행이라 부르며, @autoclosure 속성이 가지는 주요한 특징 중의 하나라고 할 수 있습니다.
