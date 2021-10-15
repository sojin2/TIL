#Optional(옵셔널)

옵셔널이란, **"nil을 담을 수 있는 타입"** 

> 일반 데이터 타입은 nil 값을 담을 수 없으며, nil 값을 넣으면 오류가 발생
> 

옵셔널은 크게 아래와 같이 두가지 경우에 사용됩니다.

**1. nil 값이 들어갈 가능성이있을 때**

**2. 정상적으로 값을 처리하지 못하는 상황이 발생했을 때, 오류를 발생시키지 않고 nil을 반환**

---

### 선언과 정의

데이터 타입 + ?

```swift
// 옵셔널 Int 
var optInt: Int?
optInt = 3

print("\(optInt)")  // Optional(3)

// 옵셔널 String
var optString: String?
optString = "Swfit"

print("\(optString)")  // Optional("Swfit")

// 옵셔널 Array 타입
var optArr: [String]?
optArr = ["C" ,"Java", "Object-C"] 

print("\(optArr)")  // Optional(["C", "Java", "Object-C"])

// 옵셔널 Dictionary 
var optDic: [String: Int]?
optDic = ["국어": 98, "수학": 88, "영어":96]

print("\(optDic)")  // Optional(["영어": 96, "국어": 98, "수학": 88])

// 값이 없는 옵셔널
var acterName: String?
print(acterName) // nil
```

### **타입 변환 + 옵셔널 처리**

```swift
let num = Int("123")
print(num)//Optional(123)let num2 = Int("소진")
print(num2)// nillet num3 = Double("235")
print(num3)// Optional(235.0)
```

---

### 옵셔널 해제 방법

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/672eb91c-313a-4945-8b59-4160aa1c8bd4/Untitled.png)

# **명시적 해제**

### 강제 해제

```swift
var optInt: Int? = 3

print("옵셔널로 둘러쌓인 값: \(optInt)")
print("!로 강제 해제한 값: \(optInt!)")
```

### 비강제 해제

### 옵셔널 바인딩 (Optional Binding)

```swift
// ---> if let 방법
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다.")
}

func printParaedInt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    }else {
        print("Int로 컨버팅 안된다아")
    }
}
printParaedInt(from: "100") // 100
printParaedInt(from: "안녕안녕 반가워") // Int로 컨버팅 안된다아

// ---> gurad ( if let보다 복잡성이 낮음 )

func printParasedInt(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안돼!")
        return
    }
    print(parsedInt)
}

printParasedInt(from: "100") //100
printParasedInt(from: "안녕안녕") //Int로 컨버팅 안돼!
```

# 묵시적 해제

- 컴파일러에 의한 자동 해제

```swift
if (optInt == 123) {
    print("optInt == 123")
} else {
    print("optInt != 123")
}

//optInt == 123

let tempInt = Int("123")

tempInt == 123 //true
tempInt == Optional(123) //true
tempInt! == 123 //true
tempInt! == Optional(123) //true
```

- ! 연산자를 사용한 자동 해제

```swift
var str: String! = "Swift Optional"
print(str) 

//Swift Optional
```

---

## **옵셔널 체이닝 (Optional Chaining)**

옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로, 또 다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있습니다.

사용법은 ?만 붙이면 됩니다.

```swift
class Person {
    var name: String
    var dog: String?
    var home: Apartment?

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?

    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let sojin: Person? = Person(name: "sojin")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let minsu: Person? = Person(name: "minsu")
//옵셔널 체이닝이 실행 후 결과 값이 nil일 수 있으므로 결과 타입도 옵셔널

//만약 우리집의 경비원의 강아지가 궁금하다면..?
sojin?.home = apart
sojin?.home?.guard = minsu
sojin?.home?.guard?.name//minsu
sojin?.home?.guard?.dog = "말티즈"

//옵셔널 체이닝을 사용하지 않는다면...func guardDog(owner:Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardDog = `guard`.dog {
                    print("우리집 경비원의 강아지는 \(guardDog) 입니다!")
                } else {
                    print("우리집 경비원은 강아지가 없어요.")
                }
            }
        }
    }
}

guardDog(owner: sojin)//우리집 경비원의 강아지는 말티즈 입니다!//옵셔널 체이닝을 사용한다면func guardDogWithOptionalChaining(owner: Person?) {
    if let guardDog = owner?.home?.guard?.dog {
        print("우리집 경비원의 강아지는 \(guardDog) 입니다!")
    } else {
        print("우리집 경비원은 강아지가 없어요.")
    }
}

guardDogWithOptionalChaining(owner: sojin)//우리집 경비원의 강아지는 말티즈 입니다!
```

더 자세히 알고 싶다면, [Optional(옵셔널)](https://coding-sojin2.tistory.com/17) 포스팅을 참고하세요!
