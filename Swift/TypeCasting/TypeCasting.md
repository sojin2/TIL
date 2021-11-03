# TypeCasting

안녕하세요! 소진입니당. 오늘은 타입캐스팅에대해서 알아보도록 하겠습니다!

이 글은 **꼼꼼한 재은씨 Swift: 문법편**을 참고하여 작성하였습니다.

---

## **1. Type Casting**

상속 관계에 있는 상위 클래스를 타입으로 선언해서 사용하는 것을 말합니다.

왜 굳이 클래스를 타입으로 선언할까요??

상위 클래스 타입으로 선언하면 인자 값으로 사용할 수 있는 객체의 범위가 훨씬 넓어집니다.

즉, 상위 클래스의 프로퍼티나 메소드부터 그 상위 클래스를 상속 받는 하위 클래스의 프로퍼티와 메소드까지 사용할 수 있습니다.

아래 코드를 보고 이해해 봅시다!

```
class Vehicle {
    var currentSpeend = 0.0

    func accelerate() {
        self.currentSpeend += 1
    }
}

class Car: Vehicle {
    var gear: Int {
        return Int(self.currentSpeend / 20) + 1
    }

    func wiper() {
// 창을 닦습니다.
    }
}

let trans: Vehicle = Car()// 가능// 하위 클래스 타입에 상위 클래스 인스턴스를 할당 할 수 없음let car: Car() = Vehicle()// Error!
```

코드의 상위 클래스는 Vehicle 이며, 하위 클래스는 Car 입니다.

이제 타입 캐스팅을 직접 해보겠습니다.

```
class SUV: Car {
    var fourWheel = false
}

let jeep: Vehicle = SUV()
```

Car 클래스를 상속받는 SUV 클래스를 정의했습니다.

SUV 클래스는

- 인스턴스를 Vehicle 클래스 타입에 할당 가능
- 인스턴스를 Car 클래스 타입에 할당 가능

```
// SUV타입의 인스턴스를 인자값으로 받아 accelerate() 메소드를 실행func move(param: SUV) {
    param.accelerate()
}

var list = [SUV]()
list.append(SUV())

// Vehicle타입의 인스턴스를 인자값으로 받아 accelerate() 메소드를 실행func move(param: Vehicle) {
    param.accelerate()
}

var list = [Vehicle]()
list.append(Vehicle())
list.append(Car())
list.append(SUV())
```

위의 예제를 보면, 더 상위 클래스를 타입으로 바꾸어주면 훨씬 넓은 범위의 객체를 인자값으로 받아올 수 있는것을 알 수 있습니다.

---

## **1.1. 타입 비교 연산자 (is)**

타입 비교 연산자 is는 타입이 일치하는지 여부를 비교하고 그 결과를 Bool형태로 돌려줍니다 (할당된 값을 비교하는거 아님 )

아래와 같은 형식이 일반적인 위치 입니다.

> 인스턴스(또는 변수, 상수) is 비교 대상 타입
> 

이 연산자는 아래와 같은 연산 법칙을 따릅니다.

- 연산자 왼쪽 인스턴스의 타입이 연산자 오른쪽 비교대상 타입과 **일치할 경우** - true
- 연산자 왼쪽 인스턴스의 타입이 연산자 오른쪽 비교대상 타입의 **하위 클래스일 경우** - true
- **그 외.** - false

아까 위에서 선언했던 코드를 사용해서 예제를 만들어 볼까요?

```
var movieCount = 0

var songCount = 0

for item in library {

    if item is Movie {

        movieCount += 1

    } else if item is Song {

        songCount += 1

    }

}

print("Media library는 \(movieCount)개의 영화와  \(songCount)개의 노래가 있습니다.")

```

library배열이 for문으로 돌면서 해당 인스턴스가 Movie타입인지 Song인지 확인하는 코드입니다.

그럼 결과 값은?

> Media library는 3개의 영화와  1개의 노래가 있습니다.
> 

---

## **1.2. 타입 캐스팅 연산 (as)**

### **(1). 업 캐스팅 (Up Casting)**

- 하위 클래스 타입을 **상위 클래스 타입으로 변환**할 때
- 캐스팅하기 전 타입이 하위 클래스, **캐스팅한 후 타입이 상위 클래스**일 때
- 캐스팅한 결과, 캐스팅하기 전 타입보다 **추상화**될 때
- 일반적으로 캐스팅 과정에서 **오류가 발생할 가능성이 없음**
- **컴파일 타임**에서 실행

업 캐스팅의 선언 형식입니다.

> 객체 as 변환할 타입
> 

### **(2). 다운 캐스팅 (Down Casting)**

- 상위 클래스 타입을 **하위 클래스 타입으로 캐스팅**할 때
- 캐스팅하기 전 타입이 상위 클래스, **캐스팅한 후 타입이 하위 클래스**
- 캐스팅한 결과, 캐스팅하기 전 타입보다 **구체화**될 때
- 캐스팅 과정에서 **오류가 발생할 가능성이 있음**
- 오류에 대한 처리 방식에 따라 **옵셔널 캐스팅**과 **강제 캐스팅**으로 나누어짐
- **런타임**에서 실행

실제로 우리가 다루는 대다수의 캐스딩이 상위 클래스 타입을 하위 클래스 타입으로 변환하는 다운 캐스팅에 해당합니다.

다운 캐스팅 과정에서 오류가 발생하면 nil이 반환됩니다. 이에따라 오류 처리 방식은

- **옵셔널** 캐스팅 : 결과값을 고려하여 옵셔널 타입을 반환
- **강제** 캐스팅 : 반드시 캐스팅에 성공한다는 전제하에 일반 타입으로 반환

두가지로 나뉩니다.

> 객체 as? 변환할 타입 (결과는 옵셔널 타입) - 캐스팅 결과가 성공이더라도 옵셔널 타입으로 변환
> 

먼저 as? 옵셔널 캐스팅을 사용해 볼까요?

```
for item in library {

    if let movie = item as? Movie {

        print("Movie: \(movie.name), dir. \(movie.director)")

    } else if let song = item as? Song {

        print("Song: \(song.name), by \(song.artist)")

   }

}
```

library는 MediaItem타입을 가지는 배열이라고 했던거 기억 나시나요? 그럼 Item값은 MediaItem타입을 가지고 인스턴스입니다.

MediaItem 슈퍼클래스 안에 Movie와 Song이 서브클래스(자식 클래스)이므로, 다운 캐스팅 되는게 맞겠죠??

그래서 Item이 Movie와 Song 클래스로 다운 캐스팅이 되다면 print구문을 실행하게 됩니다.

그럼 출력 결과를 볼까요?

```
Movie: 죽은 시인의 사회, dir. 피터 위어
Song: 창공, by 김준석
Movie: 인터스텔라, dir. 크리스토퍼 놀란
Movie: 공범자들, dir. 최승호
```

위와 같은 출력 결과가 나옵니다.

---

## **Any and AnyObject**

Any와 AnyObject을 사용하면 상속 관계에 있지 않아도 타입 캐스팅할 수 있는데요.

Any와 AnyObject를 모르겠다면?  [Any와 AnyObject](https://coding-sojin2.tistory.com/entry/Swift-Any-AnyObject-nil?category=395704) 를 참고해주세요!

```
var things = [Any]()

things.append(0)

things.append(3.9)

things.append(42)

things.append(3.141592)

things.append("sojin")

things.append((3.0, 5.0))

things.append(Movie(name: "대장 김창수", director: "이원태"))

things.append({ (name: String) -> String in "Hello, \(name)" })
```

간단하게 설명하자면 Any타입으로 선언하면 모든 타입을 넣을 수 있습니다. Int부터 클로져까지!

Any타입의 thing 배열에 (Double, Double)인 튜플, 위에서 정의한 Movie타입, 그리고 문자열을 반환하는 클로져가 들어가있습니다.

위에 as에 대해서는 예제를 못 적었는데 이번 예제에서 any와 같이 써봅시다!

as는 업캐스팅과 패턴매칭(switch)에서만 사용할 수 있다고 합니다!

```
for thing in things {

    switch thing {

    case 0 as Int:

        print("Int타입 0")

    case 0 as Double:

        print("Double 타입 0")

    case let someInt as Int:

        print("0이 아닌 Int \(someInt)")

    case let someDouble as Double where someDouble > 0:

        print("양의 Double타입 \(someDouble)")

    case is Double:

        print("Double타입 \(Double)")

    case let someString as String:

        print("String값은 \"\(someString)\"")

    case let (x, y) as (Double, Double):

        print("x와 y좌표는 \(x), \(y)")

    case let movie as Movie:

        print("영화 이름은 \(movie.name), dir. \(movie.director)")

    case let stringConverter as (String) -> String:

        print(stringConverter("소진"))

    default:

        print("이외..")

    }

}
```

출력 결과를 한번 볼까요?

> Int타입 0
> 

으로 나옵니다!!

야곰 강의에서 사용했던 예제도 추가하였습니다.

한번 참고하여 보시면 좋을 것 같아요!

```
/* 타입 캐스팅*/import Swift

/*
let someInt: Int = 100
let someDouble: Double = Double(someInt) //Double을 하나 더 추가하는 것일뿐 타입 캐스팅이 아님
*/// 타입 캐스팅을 위한 클래스 정의class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
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
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

//MARK: - 타입 확인//is를 사용하여 타입을 확인합니다.var result: Bool

result = yagom is Person// true
result = yagom is Student// false
result = yagom is UniversityStudent// false

result = hana is Person//true
result = hana is Student// true

result = jason is Person//true
result = jason is Student// true
result = jason is UniversityStudent// trueif yagom is UniversityStudent {
    print("yagom은 대학생입니다")
} else if yagom is Student {
    print("yagom은 학생입니다")
} else if yagom is Person {
    print("yagom은 사람입니다")
}// yagom은 사람입니다switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
}// json은 사람입니다.switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
}// json은 대학생입니다.//MARK: - 업 캐스팅// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다.// Any 혹은 AnyObject로도 타입 정보를 변환할 수 있습니다.// 암시적으로 처리되므로 생략해도 무방합니다.var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류var jina: Any = Person()//as Any 생략가능//MARK: - 다운 캐스팅// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줍니다.

// MARK: 조건부 다운 캐스팅// as?var optionalCasted: Student?//반환 타입이 옵셔널 타입

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent// nill
optionalCasted = jina as? UniversityStudent//nil
optionalCasted = jina as? Student//nill//MERK: 강제 다운 캐스팅//as!var forcedCasted: Student//옵셔널이 아니라서 nil이 안 뜨고 바로 죽어버림

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent // 런타임 오류//optionalCasted = jina as! UniversityStudent // 런타임 오류//optionalCasted = jina as! Student // 런타임 오류//활용func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent://is는 확인만 함
        (someone as! UniversityStudent).goToMT()//그래서 직접 값을 가져와서 캐스팅해줘야됨case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomethingWithSwitch(someone: mike)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomethingWithSwitch(someone: jenny)
// 등교를 합니다func doSomething(someone: Person) {
    if let UniversityStudent = someone as? UniversityStudent {//캐스팅과 동시에 인스턴스를 반환받아서 언랩핑가능UniversityStudent.goToMT()
    } else if let student = someone as? Student {//someone as? Student을 받아 온 후 처리
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomething(someone: mike)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomething(someone: jenny)
// 등교를 합니다

doSomething(someone: yagom)
// 숨을 쉽니다
```

---

**타입 캐스팅은 앱 제작 과정에서 굉장히 자주 사용되는 구문입니다.**

**파운데이션 프레임워크를 사용하다 보면 메소드의 반환 타입이 상위 클래스 타입으로 추상화된 경우가 많은데, 추상화된 객체를 반환받아 우리가 사용해야할 적합한 형태로 바꾸기 위해 이러한 타입 캐스팅, 그 중에서도 다운 캐스팅을 사용한다고 합니다!**
