import UIKit
import Foundation

// MARK: - 구조체 저장프로퍼티

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
// constantsOfInstance.startValue = 0 // (x)


struct ExmStruct {
    var startnum: Int
    let endnum: Int
}

let constantsOfStruct = ExmStruct(startnum: 2, endnum: 24)
// constantsOfStruct.num = 4 // 구조체 인스턴스를 상수에 할당하면 내부에 저장 프로퍼티가 변수로 선언되어있어도 변경 불가능

class ExmClass {
    var startnum = 0
    let endnum = 0
}
let constantsOfclass = ExmClass()
constantsOfclass.startnum = 5 // 클래스 인스턴스를 상수에 할당해도 내부에 저장 프로퍼티가 변수로 선언되어있으면 변경 가능

// MARK: - 지연 저장프로퍼티

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

let lz = LazyTest() //LazyTest
lz.late // OnCreate


// MARK: - 클로저를 이용한 저장 프로퍼티 초기화

class PropertyInit {
    
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
}

let cs = PropertyInit()
// value01 execute
// value02 execute

// 실행 결과 없음
cs.value01
cs.value02


// MARK: - 연산 프로퍼티

// 나이 계산
struct UserInfo{
    var birth: Int!
    
    var thisYear: Int! {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
        
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1980)
print(info.age)



// 사각형의 중심 좌표

//struct Rect {
//    var originX: Double = 0.0, originY: Double = 0.0
//    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
//
//    var centerX: Double {
//        get {
//            return self.originX + (sizeWidth / 2)
//        }
//        set(newCenterX) {
//            originX = newCenterX - (sizeWidth / 2)
//        }
//    }
//
//    var centerY: Double {
//        get {
//            return self.originY + (self.sizeHeight / 2)
//        }
//        set(newCenterY) {
//            self.originY = newCenterY - (self.sizeHeight / 2)
//        }
//    }
//}
//
//var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
//print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")
////square.centerX = 5.0, square.centerY = 5.0


// 객체 지향으로 바꾸기

struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var heigh: Double = 0.0
}

struct Rect {
    var origin = Position()
    var size = Size()
    
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.heigh / 2)
            return Position(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.heigh / 2)
        }
    }
}


let p = Position(x: 0.0, y: 0.0)
let s = Size(width: 10.0, heigh: 10.0)

var square1 = Rect(origin: p, size: s)
print("square.center = \(square1.center.x), square.centerY = \(square1.center.y)")
//square.centerX = 5.0, square.centerY = 5.0

let s2 = Size(width: 12, heigh: 12)

let p2 = Position(x: 2.5, y: 2.5)
var square2 = Rect(origin: p2, size: s)
print("square.center = \(square2.center.x), square.centerY = \(square2.center.y)")
//square.centerX = 7.5, square.centerY = 7.5

let p3 = Position(x: 5, y: 5)
var square3 = Rect(origin: p3, size: s)
print("square.center = \(square3.center.x), square.centerY = \(square3.center.y)")
//square.center = 10.0, square.centerY = 10.0

// 읽기 전용으로 정의한 center 프로퍼티
//var center: Position {
//    get {
//        let centerX = self.origin.x + (self.size.width / 2)
//        let centerY = self.origin.y + (self.size.width / 2)
//        return Position(x: centerX, y: centerY)
//    }
//}
//
//// 읽기 전용이면 get 생략 가능
//var center: Position {
//    let centerX = self.origin.x + (self.size.width / 2)
//    let centerY = self.origin.y + (self.size.width / 2)
//    return Position(x: centerX, y: centerY)
//
//}


// MARK: - 프로퍼티 옵저버
struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("이번 달 월급은 \(newIncome)원 입니다.")
        }
        didSet {
            if income > oldValue {
                print(" 월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상항조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드릴 수 없어요ㅜㅜ")
            }
        }
    }
}

var job = Job(income: 1000000)
job.income = 2000000
// 이번 달 월급은 2000000원 입니다.
//월급이 1000000원 증가하셨네요. 소득세가 상항조정될 예정입니다.

job.income = 1500000
//이번 달 월급은 1500000원 입니다.
//저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드릴 수 없어요ㅜㅜ


// MARK: - 타입 프로퍼티
struct Foo {
    // 타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티 값"
    
    // 타입 연산 프로퍼티
    static var cFoo: Int {
        return 1
    }
}

class Boo {
    // 타입 저장 프로퍼티
    static var sFoo = "클래스 타입 프로퍼티 값"
    
    //타입 연산 프로퍼티
    static var cFoo: Int {
        return 10
    }
    
    // 재정의가 가능한 타입 연산 프로퍼티
    class var oFoo: Int {
        return 100
    }
}

print(Foo.sFoo)
//"구조체 타입 프로퍼티값"

Foo.sFoo = "새로운 값"
print(Foo.sFoo)
// 새로운 값

print(Boo.sFoo)
// "클래스 타입 프로퍼티 값"

print(Boo.cFoo)
//10
