# **Function (함수)**

프로그램의 실행 과정 중에서 **독립적**으로 처리될 수 있는 부분을 분리하여 **구조화한 객체**를 의미

즉, 외부에의존하는 부분 없이 툭 떼어 분리할 수 있는 실행단위를 일종의 **캡슐**처럼 포장해 놓은 것

```
// 선언
func: 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
  함수 구현부
    return 반환값
}

// 구현
func sum(a: Int, b: Int) -> Int {
    return a + b
}
```

---

### **함수 선언**

```
// 매개 변수 X, 반환 값 Xfunc printHello() {
    print("안녕하세요")
}

// 매개 변수 X, 반환 값 Ofunc sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}

// 매개 변수 O, 반환값 X -> Void로 표시func printHelloMyName(name: String) -> Void {
    print(name)
}
// 매개 변수 O, 반환값 X -> 생략func printHelloYourName(name: String){
    print(name)
}

// 매개 변수 O, 반환 값 Ofunc sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}
```

### **함수의 호출**

함수 호출하는 법은 함수 명에 **()**만 붙이면 됩니다.

```
printHello()// 반환 값 없음
sayHello()//안녕하세요
printHelloMyName(name: "소진")// 반환값 없음
printHelloYourName(name: "소진")// 반환 값 없음
sayHelloWithName(name: "소진")// 소진님 안녕하세요
```

---

### **함수 반환 값과 튜플**

함수가 여러개의 값을 반환할때, 집단 자료형에 담아 하나로 만들어서 반환해야합니다.

이때, 사용할 수 있는 집단 자료형에는 딕셔너리나 배열, 튜플, 또는 구조체나 클래스가 있습니다.

```
// 값 두개 받기func getIndvInfo() -> (Int, String) {
    let height = 160
    let name = "소진"

    return (height, name)
}

// 값 세개 받기func getUserInfo() -> (Int, Character, String) {
// 데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언let gender: Character = "W"
    let height = 160
    let name = "소진"

    return(height, gender, name)
}

var uInfo = getUserInfo()
uInfo.0//160
uInfo.1// W
uInfo.2// "소진"var(a,b,c) = getUserInfo()
a// 160
b// "W"c// "소진"// 원하는 값만 할당하기var (height, _, name) = getUserInfo()

// 이름 지정해서 반환하기func getUserInfo2() -> (h: Int, g: Character, n: String) {
// 데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언let gender: Character = "W"
    let height = 160
    let name = "소진"

    return(height, gender, name)
}

var result = getUserInfo2()
result.h// 160
result.g// "W"
result.n// "소진"
```

### **array 타입으로 인자 값 받기**

```
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
```

---

### **Optional Tuple Return (옵셔널 튜플 반환형)**

옵셔널 튜플 반환형은 **? (물음표)**만 붙이면 됩니다.

반환 값에 접근하기위해서는 if let과 같은 옵셔널 체인을 사용하거나 강제 unwrapping 해야합니다.

```
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"
```

### **typealias (타입 알리어스)**

이름이 길거나 사용하기 복잡한 타입 표현을 새로운 타입명으로 정의해주는 문법으로, **typealias 키워**드를 사용하여 정의합니다.

타입 알리어스를 사용하면 길고 복잡한 형태의 타입 표현도 짧게 줄일 수 있어 전체적으로 소스 코드가 간결해지는 효과를 가져올 수 있습니다.

```
// typealias - 타입 알리어스//typealias <새로운 타입 이름> = <타입 표현>typealias infoResult = (Int, Character, String)

func getUserInfo() -> infoResult {
    let gender: Character = "W"
    let heighr = 160
    let name = "소진"

    return (heighr, gender, name)
}

let info = getUserInfo3()
info.0// 160
info.1// "W"
info.2// "소진"typealias infoResult = (h: Int, g: Character, n: String)

func getUserInfo() -> infoResult {
    let gender: Character = "W"
    let heighr = 160
    let name = "소진"

    return (heighr, gender, name)
}

let info = getUserInfo4()
info.h// 160
info.g// "W"
info.n// "소진"
```

---

### **인자 레이블**

파라미터 앞에 인자 라벨을 지정해 실제 함수 내부에서 해당 인자를 식별하기 위한 이름과 함수 호출시 사용하는 이름을 다르게 해서 사용할 수 있습니다.

```
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."
```

---

### **매개 변수**

```
// 외부 변수 X, 내부 변수 Ofunc printHello(name: String, welcomeMessage: String) {
    print("\(name)님 \(welcomeMessage)")
}
printHello(name: "소진", welcomeMessage: "반갑습니다!")// 소진님 반갑습니다!// 호출할때 값만 넘겨주고 싶으면 _를 추가한다func printTotalPrice(_ price: Int,_ count: Int) {
    print("Total Price: \(price * count)")
}
printTotalPrice(1500, 5)// 7500// 외부 변수 O (한글), 내부 변수 Ofunc printTotalPrice3(가격 price: Int,갯수 count: Int) {
    print("Total Price: \(price * count)")
}
printTotalPrice3(가격: 1500,갯수: 5)// 7500
```

### **가변 인자**

```
func avg(score: Int...) -> Double {
    var total = 0// 점수 합계for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}

print(avg(score: 10,20,30,40))// 25.0
```

### **기본 값을 갖는 매개변수**

```
// default값 지정하기func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total Price: \(price * count)")
}

printTotalPriceWithDefaultValue(count: 6)// 9000
printTotalPriceWithDefaultValue(count: 3)// 4500
printTotalPriceWithDefaultValue(count: 10)// 15000
printTotalPriceWithDefaultValue(count: 22)// 33000

// price를 다른 값으로 받고 싶어요!
printTotalPriceWithDefaultValue(price: 2000, count: 3)// 6000
```

### **매개 변수 수정**

변수는 원래 마음대로 값을 수정할 수 있어야하지만, 매개 변수는 수정이 불가능합니다.

스위프트에서 함수의 인가 값이 변수가 아니라 상수로 정의되어있기때문에 정확하게는 매개 상수라고 해야 맞습니다.

그럼 매개 변수를 수정하려면 어떻게 해야할까요?

기본적으로 아래 코드처럼 매개 변수와 동일한 이름으로 변수를 정의하고 매개 변수의 값을 대입해 주면 됩니다.

```
// Error base 인자는 상수이므로 값 변경 불가능func incrementBy(base: Int) -> Int{
    base += 1
    return base
}

// 변수 값에 대입하면 인자 값 사용 가능func incrementBy(base: Int) -> Int {
    var base = base
    base += 1
    return base
}
```

### **InOut 매개 변수**

inout 키워드의 정확한 의미는 값 자체를 전달하는 것이 아니라 값이 저장된 메모리 주소를 전달한다는 의미입니다.

그래서 **주소 연산자 &**를 붙여줍니다. 즉, **참조(Reference)에 의한 전달**이라고 합니다.

```
var value = 3
func incrementAndPrint(_ value: Int) -> Int {
    var value = value
    value += 1

    return value
}

print(incrementAndPrint(value))// 4print(value)// 3// In-Out 키워드 사용func incrementAndPrint2(_ value: inout Int) -> Int {
    value += 1
    return value
}

print(incrementAndPrint2(&value))// 4print(value)// 4
```

---

## **일급 객체로서의 함수**

- 객체가 런타임에도 생성 가능해야 한다.
- 인자 값으로 객체를 전달 할 수 있어야 한다.
- 반환 값으로 객체를 사용할 수 있어야 한다.
- 변수나 데이터 구조 안에 저장할 수 있어야 한다.
- 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다.

### **일급 함수의 특성 1 : 변수나 상수에 함수를 대입할 수 있음**

함수 타입은 일반적으로 함수의 형태를 축약한 형태로 사용하는데, 이때 함수의 이름이나 실행 내용 등은 함수 타입에서는 아무런 의미가 없으므로 생략할 수 있습니다. 아래와 같은 형식으로 나타냅니다.

```swift
(인자 타입1, 인자 타입1, ...) -> 반환 타입
```

```
func boo(age: Int, name: String) -> String {
    retunrn "\(name)의 나이는 \(age)세 입니다."
}

// boo 함수의 타입 표현
(Int, String) -> String

// 상수에 할당한 함수let fn: (Int, String) -> String = boo

// 정확한 식별자 사용let fn: (Int, String) -> String = boo(age:name:)
```

★ boo : 함수의 이름

**★** boo(age:name) : 함수의 식별자

**만약, 같은 함수 이름을 가지고 있는 경우에는 어떻게 식별해야할까요?**

```
func boo(age: Int) -> String {
    return "\(age)"
}

func boo(age: Int, name: String) -> {
    return "\(name)의 나이는 \(age)세 입니다."
}

// 방법 1) 타입 어노테이션을 통해 입력받을 함수의 타입을 지정let t1: (Int, String) -> String = boo

// 방법 2) 함수의 식별 값을 통해 입력 받을 정확한 함수를 지정let t2 = boo(age:name:)

// 방법 3)let fn01: (Int) -> String = boo//boo(age:)let fn02: (Int,String) -> String = boo//boo(age:name:)
```

함수에서 반환 값이 없을때는 빈 괄호()와 Void로 표현 가능했죠?

함수 타입도 동일하게 빈 괄호()와 Void로 표현할 수 있습니다. 하지만 빈 입력값은 Void를 사용할 수 없어요!

정리해서 말하자면,

빈 반환 값 표현 -> Void 사용

빈 입력 값 표현 -> ()  빈 괄호 사용 (Void 사용 안됨!)

```
(Int) -> Void
() -> Void
```

<사용 예시>

```
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

mathFunction = multiplyTwoInts

print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
```

### **일급 함수의 특성 2 : 함수의 반환 타입으로 함수를 사용할 수 있음**

반환 값이  함수일 경우 아무래도 함수의 형식이 복잡해질 가능성이 큽니다.

아래 그림을 참고하세요!

![https://blog.kakaocdn.net/dn/c08ayp/btrh1SRthYE/4vkj9wEQOC83S2Ll9JiCaK/img.png](https://blog.kakaocdn.net/dn/c08ayp/btrh1SRthYE/4vkj9wEQOC83S2Ll9JiCaK/img.png)

```
func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func times(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }

    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+" :
        return plus
    case "-" :
        return minus
    case "*" :
        return times
    case "/" :
        return divide
    default :
        return plus
    }
}

let resultplus = calc("+")
resultplus(3,4)// 7
calc("+")(3,4)

let resultminus = calc("-")
resultminus(3,4)// -1let resulttimes = calc("*")
resulttimes(3,4)// 12let resultdivide = calc("/")
resultdivide(3,4)// 0
```

### **일급 함수의 특성3 : 함수의 인자 값으로 함수를 사용할 수 있음**

이 개념은 콜백 함수에 대해 알아보면 쉽게 이해가 가능합니다.

**콜백 함수(Callback Function)**란,

특정 구문의 실행이 끝나면 시스템이 호출하도록 처리된 함수로서, 일반적으로 Ajax 통신을 위한 구문을 작성할 때 콜백함수를 등록합니다.

그럼 **콜백 함수 등록**이란? 실행하고자 하는 구문을 담은 함수를 인자 값으로 넣는 것을 의미합니다.

이때 사용되는 개념이 바로 일급 함수의 특성인 ' 함수의 인자값으로 사용할 수 있다' 입니다.

함수를 인자 값으로 전달하는 예제입니다.

```
func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr)// 4
```

```
func successThrough() {
    print("연산 처리가 성공했습니다.")
}

func failThrough() {
    print("처리 과정에 오류가 발생하였습니다.")
}

func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {

    guard base != 0 else {
        fCallBack()
        return 0
    }

    defer {
        sCallBack()// 성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 30, success: successThrough, fail: failThrough)
```

위에 또 다른 코드를 살펴 보면, 성공했을 때와 실패했을 때의 처리를 함수 내부 코드를 수정하지 않고도 외부에서 함수 내부의 실행 과정에 간섭 할 수 있는 것을 알 수 있습니다. 완전히 실행 흐름을 꺾지는 못하지만, 그 실행 흐름에 합류하여 추가 기능을 수행하는 것 정도는 충분히 가능합니다.

---

### **중첩 함수**

중첩 함수(Nested Function)이란, 함수 내에 다른 함수를 작성해서 사용하는 함수를 말합니다.

**내부 함수(Inner Function)**

중첩 함수를 부분별로 나누어 보면 함수 내에 작성된 함수는 외부함수가 실행되는 순간 생성되고, 종료되는 순간 소멸은닉성을 가짐

**외부 함수(Outer Function)**

내부 함수를 포함하는 바깥쪽 함수프로그램이 실행될 때 생성되고 프로그램이 종료될 때 소멸

### **내부 함수의 생명 주기 (Life Cycle)**

외부 함수가 실행되면서 내부 함수에 대한 참조가 발생하면 생성되고, 외부 함수가 종료되면서 내부 함수에 대한 참조도 종료되면 내부함수는 소멸즉, 외부 함수 종료 -> 내부 함수도 존재 X

아래는 중첩 함수 코드 예시 입니다.

```
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

// moveNearerToZero는 이제 중첩 돼 있는 stepForward() 함수를 가르킵니다.while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...// -3...// -2...// -1...// zero!
```

---

## **변수의 생존 범위와 생존 주기**

**전역 번수 = 글로벌(Global) 변수**

: 프로그램의 최상위 레벨에서 작성된 변수를 의미합니다.

이 변수는 일반 적으로 프로그램 내 모든 위치에서 참조할 수 있으며, 특별한 경우를 제외하면 프로그램이 종료되기 전까지는 삭제되지 않습니다.

**지역 변수 = 로컬(local) 변수**

: 특정 범위 내에서만 참조하거나 사용할 수 있는 변수를 의미합니다.

조건절이나 함수 구문 등 특정 실행 블록 내부에서 선언된 변수는 모두 지역 변수이며 선언된 블록 범위 안에서만 이 변수를 참조할 수 있습니다.

지역 변수는 선언된 블록에서 실행되면서 생겼다가 실행 블록이 끝나면 제거됩니다.

**블록별 변수의 검색 순서**

함수 내부에서 정의된 변수를 찾음 -> 함수 외부에서 정의된 변수를 찾음 -> 글로벌 범위에서 정의된 변수를 찾음 -> import 된 라이브러리 범위

```
var count = 30//전역 변수func foo(count: Int) -> Int {
    var count = count// 지역 변수count += 1
    return count
}

print(foo(count: count))// 함수 내부의 count 변수값 : 31print(count)// 외부에서 정의된 count 변수값 : 30
```
