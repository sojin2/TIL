import UIKit
import Foundation

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

// 연산 프로퍼티

struct UserInto {
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



let p = Position(x: 0.0, y: 0.0)
let s = Size(width: 10.0, heigh: 10.0)

var square = Rect(origin: p, size: s)
print("square.center = \(square.center.x), square.centerY = \(square.center.y)")

let s2 = Size(width: 12, heigh: 12)

let p2 = Position(x: 2.5, y: 2.5)
var square2 = Rect(origin: p2, size: s)
print("square.center = \(square2.center.x), square.centerY = \(square2.center.y)")

let p3 = Position(x: 5, y: 5)
var square3 = Rect(origin: p3, size: s)
print("square.center = \(square3.center.x), square.centerY = \(square3.center.y)")

