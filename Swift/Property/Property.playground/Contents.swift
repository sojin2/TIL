import UIKit

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

