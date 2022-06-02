# **Type Casting**

상속 관계에 있는 상위 클래스를 타입으로 선언해서 사용하는 것을 말합니다.

먼저 클래스들을 정의해보겠습니다.

```swift
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToClass() {
        print("수업을 갑니다.")
    }
}

```

타입 캐스팅

```swift
var sojin: Person = Person()
var minsu: Student = Student()
var jimin: UniversityStudent = UniversityStudent()
```

---

# **타입 비교 연산자 (is)**

타입 비교 연산자 is는 타입이 일치하는지 여부를 비교하고 그 결과를 Bool형태로 돌려줍니다. 

(할당된 값을 비교하는거 아님)

- 연산자 왼쪽 인스턴스의 타입이 연산자 오른쪽 비교대상 타입과 **일치할 경우** - true
- 연산자 왼쪽 인스턴스의 타입이 연산자 오른쪽 비교대상 타입의 **하위 클래스일 경우** - true
- **그 외.** - false

```swift
인스턴스(또는 변수, 상수) is 비교 대상 타입
```

```swift
var result: Bool // Bool 값만 출력함

result = sojin is Person // true
result = sojin is Student // false
result = sojin is UniversityStudent // false

result = minsu is Person //true
result = minsu is Student // true

result = jimin is Person //true
result = jimin is Student // true
result = jimin is UniversityStudent // true

// if와 switch
if sojin is UniversityStudent {
    print("sojin은 대학생입니다")
} else if sojin is Student {
    print("sojin은 학생입니다")
} else if sojin is Person {
    print("sojin은 사람입니다")
} 
// sojin은 사람입니다

switch minsu {
case is Person:
    print("minsu은 사람입니다")
case is Student:
    print("minsu은 학생입니다")
case is UniversityStudent:
    print("minsu은 대학생입니다")
default:
    print("minsu은 사람도, 학생도, 대학생도 아닙니다")
} 
// minsu은 사람입니다.

switch jimin {
case is UniversityStudent:
    print("jimin은 대학생입니다")
case is Student:
    print("jimin은 학생입니다")
case is Person:
    print("jimin은 사람입니다")
default:
    print("jimin은 사람도, 학생도, 대학생도 아닙니다")
} 
// jimin은 대학생입니다.
```

---

# **타입 캐스팅 연산 (as)**

### **업 캐스팅 (Up Casting)**

- 하위 클래스 타입을 **상위 클래스 타입으로 변환**할 때
- 캐스팅하기 전 타입이 하위 클래스, **캐스팅한 후 타입이 상위 클래스**일 때
- 캐스팅한 결과, 캐스팅하기 전 타입보다 **추상화**될 때
- 일반적으로 캐스팅 과정에서 **오류가 발생할 가능성이 없음**
- **컴파일 타임**에서 실행
- as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줌
- Any 혹은 AnyObject로도 타입 정보를 변환 가능
- 암시적으로 처리되므로 생략해도 무방

```swift
var mike: Person = UniversityStudent() as Person // Person으로 업캐스팅 가능
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류 (다운 캐스팅이라 오류)
var jina: Any = Person() //as Any 생략가능
```

### **다운 캐스팅 (Down Casting)**

- 상위 클래스 타입을 **하위 클래스 타입으로 캐스팅**할 때
- 캐스팅하기 전 타입이 상위 클래스, **캐스팅한 후 타입이 하위 클래스**
- 캐스팅한 결과, 캐스팅하기 전 타입보다 **구체화**될 때
- 캐스팅 과정에서 **오류가 발생할 가능성이 있음**
- 오류에 대한 처리 방식에 따라 **옵셔널 캐스팅**과 **강제 캐스팅**으로 나누어짐
- **런타임**에서 실행

다운 캐스팅 과정에서 오류가 발생하면 nil이 반환됩니다.

### 오류 처리 방식

- **옵셔널** 캐스팅 : 결과값을 고려하여 옵셔널 타입을 반환

```swift
// MARK: 조건부 다운 캐스팅
// as?

var optionalCasted: Student? //반환 타입이 옵셔널 타입

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil Student라
optionalCasted = jina as? UniversityStudent //nil Person이라
optionalCasted = jina as? Student //nil Person이라
```

- **강제** 캐스팅 : 반드시 캐스팅에 성공한다는 전제하에 일반 타입으로 반환

```swift
optionalCasted = mike as! UniversityStudent
optionalCasted = jenny as! UniversityStudent // 런타임 오류 
optionalCasted = jina as! UniversityStudent // 런타임 오류
optionalCasted = jina as! Student // 런타임 오류
```

### **활용**

```swift
func doSomethingWithSwitch(someone: Person) {
    switch someone { // someone이 ... 타입과 일치해? (비교만 함)
    case is UniversityStudent: 
        (someone as! UniversityStudent).goToClass() // 직접 값을 가져와서 캐스팅해줘야됨
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
// 수업을 갑니다.

doSomethingWithSwitch(someone: mike)
// 수업을 갑니다.

doSomethingWithSwitch(someone: jenny)
// 등교를 합니다.

func doSomething(someone: Person) {

        //캐스팅과 동시에 인스턴스를 반환받아서 언랩핑가능
    if let UniversityStudent = someone as? UniversityStudent { 
        UniversityStudent.goToClass()

        //someone as? Student을 받아 온 후 처리
    } else if let student = someone as? Student { 
        student.goToSchool()

    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)
// 수업을 갑니다.

doSomething(someone: mike)
// 수업을 갑니다.

doSomething(someone: jenny)
// 등교를 합니다.

doSomething(someone: sojin)
// 숨을 쉽니다.
```

---
