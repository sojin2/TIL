# Class&Struct&Enum

## **Class**

- 프로퍼티(클래스 안의 변수)와 메소드(클래스 안의 함수)를 가질 수 있는 컨테이너 타입을 정의하기위한 용도
- 일반적으로 단일 상속이 가능하지만, [프로토콜](https://coding-sojin2.tistory.com/entry/%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C?category=395704)을 사용하면 다중 상속도 가능
- 참조타입 (=reference type) (call by reference)
- [형 변환(Type Casting)](https://coding-sojin2.tistory.com/entry/%ED%83%80%EC%9E%85-%EC%BA%90%EC%8A%A4%ED%8C%85?category=395704)과 관련된 기능과 파괴자(Deinitializer)등의 기능을 가질 수 있다.
- iOS 프레임 워크의 대부분의 큰 뼈대는 모두 클래스로 구성

---

## **실행해보기**

```swift
class Exm {
    var name = "Sojin"

    func say(){
        print("Hello, " + name + "!")
    }
}

var obj:Exm = Exm();// 인스턴스 생성

obj.say();// Hello, Sojin!

obj.name = "Hanako";// Sojin -> Hanako

obj.say();// Hello, Hanako
```

## **상속하기**

부모 클래스를 상속 받아 새로운 자식 클래스를 만드는 과정을 **서브 클래싱(Subclassing)**이라고 합니다:-)

```swift
class Helo {
    var name:String = "Sojin";
    func say(){
        print("Hello, " + name + "!");

    }

}

class Hello:Helo {
    var name2:String = "YAMADA";
    func say2(){
        print("Hi," + name + "-" + name2 + "!");

    }

}
var obj:Hello = Hello();

obj.say();
obj.name = "Sojin";
obj.name2 = "TANAKA";
obj.say2();

```

위 코드에서는 Hello 클래스 인스턴스만 생성했는데 Helo클래스의 함수와 객체를 선언해서 문제 없이 사용하고 있는 것을 볼 수 있습니다.

이유는 당연히 **상속**을 사용했기 때문이겠지요? Hello 클래스(자식 클래스) 가 Helo 클래스(부모 클래스)를 상속 받았기 때문에 부모 클래스인 Helo의 객체와 함수등을 모두 가져다가 사용할 수 있는 것입니다!

---

## **Struct**

- C 언어 구조체 용도와 비슷하지만, 추가로 멤버 변수(프로퍼티), 함수(메소드) 정의 가능
- **상속이 불가능**
- **[확장(extention)](https://coding-sojin2.tistory.com/entry/%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C?category=395704) 등 기능 사용 가능**
- **값 타입** (= Value Type)
- Swift의 대부분의 큰 뼈대는 모두 구조체로 구성

## 실행해보기

```swift
struct Student {
    var name : String = "unknown"
    var `class`: String = "Swift"

    static func selfIntroduce() {
        print("학생타입입니다")
    }

    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce() //학생 타입 입니다.
var sojin: Student = Student()
sojin.name = "sojin"
sojin.class = "스위프트"
sojin.selfIntroduce() //저는 스위프트반 sojin입니다.

let jina:Student = Student()

//불변 인스턴스이므로 프로퍼티 값 변경 불가
//컴파일 오류 발생
//jin.name = "jina"
jina.selfIntroduce()//저는 Swift반 unknown입니다.

```

아래 코드의 data 처럼 직접 변수 값들을 넣어주면서 인스턴스를 생성하는 것도 가능합니다.

```swift
struct MyData {

    var age:Int
    var name:String

    func getData() ->String {
        return "[\(name)(\(age))]"

    }

}

var data = MyData(age: 99, name: "Taro")
var data2 = data
data2.name = "Sojin"
data2.age = 24
print(data.getData())// Taro(99)print(data2.getData())// Sojin(24)
```

## **Mutating function**

Mutating function이란 구조체의 매서드가 구조체 내부에서 **데이터를 수정**할 때 선언하는 키워드입니다.

아래 코드를 보면서 이해해봅시다.

```swift
struct Point {
var x = 0
var y = 0

// 컴파일 에러남.func moveTo(x: Int, y: Int) {
    self.x = x
    self.y = y
  }

// 정상 실행mutating func moveTo2(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
}
```

---

### **클래스와 구조체의 공통점**

1. 메소드 : 함수를 사용하여 기능을 제공하는 메소드를 정의할 수 있다.
2. 초기화 블록 : 객체를 원하는 초기 상태로 설정해주는 초기화 블록을 정의할 수 있다.
3. 프로토콜 : 특정 형식의 함수적 표준을 제공하기 위한 프로토콜을 구현할 수 있다.
4. 확장 : 객체에 함수적 기능을 추가하는 확장(extends) 구문을 사용할 수 있다.
5. 서브스크립트 : 속성 값에 접근할 수 있는 방법을 제공하는 서브 스크립트를 정의할 수 있다.
6. 프로퍼티 : 변수나 상수를 사용하여 값을 저장하는 프로퍼티를 정의할 수 있다.

### **클래스와 구조체의 차이점**

1. **구조체**는 value type, **클래스**는 reference type 입니다.
2. **구조체**는 상속이 불가능합니다.
3. **구조체**에서는 AnyObject로 타입캐스팅이 불가능합니다.
4. **구조체**는 생성자를 구현하지 않을 시 기본 initializer를 사용할 수 있습니다.
5. **클래스**는 reference counting으로 메모리 관리가 가능합니다.

---

## **Enum**

- **상속 불가**
- **값 타입** (값이 없을 수도 있음. 즉 이름 그 자체 만으로 고유한 의미를 나타낼 수 있음)
- 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의한 것 예) 요일, 상태값, 월(Month)
- 열거형 자체가 **하나의 데이터 타입**
- 열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급

## **정의 및 구현**

```swift
enum 열거형 이름 {
//열거형 멤버 정의case 멤버값 1
    case 멤버값 2,3// 한꺼번에 멤버 선언도 가능case ...
}
```

열거형 타입을 생략할 수 있을 때와 없을 때

1. 열겨형 타입으로 정의된 변수에는 열거형 타입명을 생략하고 멤버값만 대입해도 오류가 발생하지 않는다.

2. 변수나 상수의 타입 어노테이션을 명시한 경우, 처음부터 타입명을 생략하고 멤버값만 대입해도 오류가 발생하지 않는다.

3. 타입 어노테이션 없이 변수나 상수를 초기화할 때 타입명은 생략할 수 없다.

```swift
enum Direction {
    case north
    case south
    case east, west
 }

// 멤버들 사용하기let N = Direction.north
 var S: Direction = Direction.south// 타입어노테이션 선언var S: Direction = .east// 열거형 타입 이름 생략 가능S = .east// 앞에서 타입이 선언되어 타입명을 생략하고 멤버값만 사용
```

### **Switch 문**

Swiftch문은 반드시 열거형의 모든 경우(cases)를 포함해야합니다.

하지만, default 구문을 사용하면 모든 case를 포함하지 않아도됩니다.

```swift
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

switch day {// day라는 열거형 값case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat,.sun:
    print("신나는 주말!!")
}

switch day {
case .mon, .tue, .wed, .thu, .fri:
    print("평일입니다")
default:
    print("주말입니다")

}
```

### **Associated Values**

멤버에 보조 값을 설정하는 것을 연관 값(Associated Values)이라고 합니다.

```swift
enum ImageFormat {
    case JPEG
    case PNG(Bool)
    case GIF(Int,Bool)
}

var newImage = ImageFormat.PNG(true)
newImage = .GIF(256,false)
```

연관 값은 세부적으로 구분하기 위한 용도 이외에도 실행 시점에서 값을 저장해야 할 필요가 있을 때 사용됩니다.

### **rawValue 속성**

문자열 형식의 멤버에 값을 할당할 수 있는데, 이때 rawValue 속성을 사용합니다.

정수 값만 지정하면 자동 할당 기능도 사용할 수 있습니다.

```swift
enum Rank: Int {
    case one = 1
    case two, three, four
 }

 Rank.one.rawValue// 1Rank.two.rawValue// 2Rank.three.rawValue// 3Rank.four.rawValue// 4
```

---

클래스, 구조체, 열거형에 대해서 살펴보았는데요. 설명을 잘 했나 모르겠네요..
좀 더 자세히 알고 싶다면, 아래 블로그를 참고해주세요!
[클래스](https://coding-sojin2.tistory.com/36)
[구조체](https://coding-sojin2.tistory.com/59)
[열거형](https://coding-sojin2.tistory.com/126)

