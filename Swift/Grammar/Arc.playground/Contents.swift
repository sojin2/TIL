import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// Person 클래스 타입의 옵셔널 변수 선언
var reference1: Person?
var reference2: Person?
var reference3: Person?

// 모두 초기값 nil
reference1
reference2
reference3

// reference1이 Person 인스턴스 참조하도록 함
// 참조 횟수 : 1
reference1 = Person(name: "sojin Appleseed")
// Prints "Sojin Appleseed is being deinitialized"

reference1
reference2
reference3


// 다른 변수도 reference1을 참조
reference2 = reference1
reference3 = reference1

// 모두 reference1이 참조하고있는 Person인스턴스를 참조하고 있음
// 참조 횟수 : 3
reference1
reference2
reference3


// nil 처리하여 reference1,2 참조 해지
// 참조 횟수 : 1 (reference3만 참조중)
reference1 = nil
reference2 = nil

reference1
reference2
reference3


// reference3 참조 해지
// 참조 횟수 : 0 -> ARC가 Person 인스턴스 메모리에서 해지
reference3 = nil
// Prints "Sojin Appleseed is being deinitialized"
