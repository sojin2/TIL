import UIKit
import Foundation

/*
 { (param) -> return type in
    statment
    ....
 }
*/

// Example 1: cho Simple Closure

//let choSimpleClosure = {
//
//}
//choSimpleClosure()

// Example 2: 코드 블록을 구현한 Closure

//let choSimpleClosure = {
//    print("Hello, 클로저! :)")
//}
//
//choSimpleClosure()

// Example 3: input parameter를 받는 Closure


//let choSimpleClosure: (String) -> Void = { name in
//    print("Hello, 클로저, 나의 이름은 \(name) 입니다.")
//}
//
//choSimpleClosure("김소진")

// Example 4: 값을 Return하는 Closure

//let choSimpleClosure: (String) -> String = { name in
//    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요!"
//    return message
//}
//
//let retult = choSimpleClosure("소진")
//print(retult)
//
//print(choSimpleClosure("소진"))

// Example 5: Closure를 Parameter로 받는 함수 구현

// 함수만 실행 됨
//func someSimpleFunction(choSimpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요")
//}
//
//someSimpleFunction(choSimpleClosure: {
//    print("안녕, 클로저")
//})

// 클로저만 실행 됨
//func someSimpleFunction(choSimpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요")
//    choSimpleClosure()
//}
//
//someSimpleFunction(choSimpleClosure: {
//    print("안녕, 클로저")
//})


// Example 6: Trailing Closure

//func someSimpleFunction(message: String, choSimpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요. 메세지는 \(message)")
//    choSimpleClosure()
//}
//
//someSimpleFunction(message: "저는 소진입니다.", choSimpleClosure: {
//    print("안녕, 클로저")
//})
//
//// 클로저 단축 문법 : 인자 맨 마지막에 클로저가 있으면 생략 가능
//someSimpleFunction(message: "저는 소진입니다."){
//    print("안녕, 클로저")
//}
//


//---> 선언 문법

//var multiplyClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
//    return $0 * $1 //들어오는 인덱스 값의 0번째와 1번째 값을 연산하겠다
//}

//var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }


var multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}

let result = multiplyClosure(4,2)


// fuction이 closure을 받아서 사용

func operateTwoNum(a: Int, b: Int, opertion: (Int,Int) -> Int) -> Int {
    let result = opertion(a,b)
    return result
}
operateTwoNum(a: 4, b: 2, opertion: multiplyClosure)

var addClosure: (Int, Int) -> Int = {a, b in
    return a+b
}
operateTwoNum(a: 4, b: 2, opertion: addClosure)

operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
}

// 인자 값과 반환 값이 없는 클로저
let voidClosure: () -> Void = {
    print("iOS 개발자 짱, 클로저 사랑해")
}

voidClosure()

// Capturing Value

var count = 0

let incrementer = { // 위에있는 count 값을 캡쳐하여 계속 사용
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()

count

var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}

value.sort(by: order)

// 클로저 표현식으로 바꾸기
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


// Trailing Closure 트레일링 클로저
value.sort() { (s1, s2) in
    return s1 > s2
}

func divide(base: Int, success s: () -> Void) -> Int {
    defer {
        s() //성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 100) { () in
    print("연산이 성공했습니다.")
    
}

func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f() //실패 함수를 실행한다.
        return 0
    }
    
    defer {
        s() //성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 100, success: { () in
    print("연산이 성공했습니다.")
}) { () in
    print("연산에 실패하였습니다.")
}

// 허용 안 됨
//divide(base: 100 { () in
//    print("연산에 성공했습니다.")
//} { () in
//    print("연산에 실패했습니다.")
//}


//@escaping
func callback(fn: () -> Void) {
    fn()
}

callback {
    print("Closure가 실행되었습니다.")
}
//Closure가 실행되었습니다.




