import UIKit
import Darwin

// Function

func printName() {
    print("---> My name is Jason")
}

printName()


// 매개 변수 X, 반환 값 X
func printHello() {
    print("안녕하세요")
}

// 매개 변수 X, 반환 값 O
func sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}

// 매개 변수 O, 반환값 X -> Void로 표시
func printHelloMyName(name: String) -> Void {
    print(name)
}
// 매개 변수 O, 반환값 X -> 생략
func printHelloYourName(name: String){
    print(name)
}

// 매개 변수 O, 반환 값 O
func sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}

printHello() // 반환 값 없음
sayHello() //안녕하세요
printHelloMyName(name: "소진") // 반환값 없음
printHelloYourName(name: "소진") // 반환 값 없음
sayHelloWithName(name: "소진") // 소진님 안녕하세요




// ---> 다양하게 함수 param 받기?

// param 1개
// 숫자를 받아서 10을 곱해서 출력

func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)

// param 2개
// 물건 값과 갯수를 받아서 전체 금액을 출력하는 함수

func printTotalPrice(price: Int, count: Int) {
    print("Total Price: \(price * count)")
}

printTotalPrice(price: 1500, count: 5)





// 반환 값 여러개 받기

// 값 두개 받기
func getIndvInfo() -> (Int, String) {
    let height = 160
    let name = "소진"
    
    return (height, name)
}

// 값 세개 받기
func getUserInfo() -> (Int, Character, String) {
    // 데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언
    let gender: Character = "W"
    let height = 160
    let name = "소진"
    
    return(height, gender, name)
}

var uInfo = getUserInfo()
uInfo.0 // 160
uInfo.1 // W
uInfo.2 // "소진"

var(a,b,c) = getUserInfo()
a // 160
b // "W"
c // "소진"

// 원하는 값만 할당하기
var (height, _, name) = getUserInfo()



// 이름 지정해서 반환하기
func getUserInfo2() -> (h: Int, g: Character, n: String) {
    // 데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언
    let gender: Character = "W"
    let height = 160
    let name = "소진"
    
    return(height, gender, name)
}

var result = getUserInfo2()
result.h  // 160
result.g // "W"
result.n // "소진"





// typealias - 타입 알리어스

//typealias <새로운 타입 이름> = <타입 표현>

typealias infoResult = (Int, Character, String)

func getUserInfo3() -> infoResult {
    let gender: Character = "W"
    let heighr = 160
    let name = "소진"
    
    return (heighr, gender, name)
}

let info = getUserInfo3()
info.0 // 160
info.1 // "W"
info.2 // "소진"

typealias infoResult2 = (h: Int, g: Character, n: String)

func getUserInfo4() -> infoResult2 {
    let gender: Character = "W"
    let heighr = 160
    let name = "소진"
    
    return (heighr, gender, name)
}

let info2 = getUserInfo4()
info2.h // 160
info2.g // "W"
info2.n // "소진"




// ---> Exteral Parameter Name 설정

// 외부 변수 X, 내부 변수 O
func printHello(name: String, welcomeMessage: String) {
    print("\(name)님 \(welcomeMessage)")
}
printHello(name: "소진", welcomeMessage: "반갑습니다!")

// 호출할때 값만 넘겨주고 싶으면 _를 추가한다
func printTotalPrice2(_ price: Int,_ count: Int) {
    print("Total Price: \(price * count)")
}

printTotalPrice2(1500, 5)

// 외부 변수 O (한글), 내부 변수 O
func printTotalPrice3(가격 price: Int,갯수 count: Int) {
    print("Total Price: \(price * count)")
}
printTotalPrice3(가격: 1500,갯수: 5)


// 가변 인자
func avg(score: Int...) -> Double {
    var total = 0 // 점수 합계
    for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}

print(avg(score: 10,20,30,40)) // 25.0




// default값 지정하기
func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total Price: \(price * count)")
}
printTotalPriceWithDefaultValue(count: 6)
printTotalPriceWithDefaultValue(count: 3)
printTotalPriceWithDefaultValue(count: 10)
printTotalPriceWithDefaultValue(count: 22)

printTotalPriceWithDefaultValue(price: 2000, count: 3) // price를 다른 값으로 받고 싶어요!




// 함수값 반환
func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice


// Error base 인자는 상수이므로 값 변경 불가능
//func incrementBy(base: Int) -> Int{
//    base += 1
//    return base
//}



// 값을 대입하면 인자 값 사용 가능
func incrementBy(base: Int) -> Int {
    var base = base
    base += 1
    return base
}



// 도전 과제!

// 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기
// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
// 3. 성, 이름을 받아서 fullname return 하는 함수 만들기


// 1번
func printFullName(firstname : String, lastname : String) {
    print("full name : \(firstname) \(lastname)")
}

printFullName(firstname: "kim", lastname: "sojin")


// 2번
func printParamterFullName(_ firstname : String,  _ lastname : String) {
    print("full name : \(firstname) \(lastname)")
}

printParamterFullName("Kim", "sojin")

// 3번
func printReturnFullName(firstname : String, lastname : String) -> String {
    return firstname + lastname
}

let name2 = printReturnFullName(firstname: "kim", lastname: "sojin")
print(name2)




// 고급 기능
// func functionName (externalName param: ParamType) -> ReturnType {
//          //......
//          return retunValue
//}

// overload

func printTotalPrice4(price: Int, count: Int) {
    print(" Total Price: \(price * count)")
}

func printTotalPrice5(price: Double, count: Double) {
    print(" Total Price: \(price * count)")
}

func printTotalPrice6(가격: Double, 개수: Double) {
    print(" Total Price: \(가격 * 개수)")
}





// In-out paramter

// Error! paramter는 복사되서 들어오는데 constant(상수) 값이다 --> 값이 변경 안된다
// 그래서 paramter값을 변경하고 싶은 경우에는 in-out 키워드를 이용해서 copy in-out 을 사용해야한다!
//
var value = 3
func incrementAndPrint(_ value: Int) -> Int {
    var value = value
    value += 1

    return value
}

print(incrementAndPrint(value)) // 4
print(value) // 3

func incrementAndPrint2(_ value: inout Int) -> Int {
    value += 1
    return value
}

print(incrementAndPrint2(&value))
print(value)





//---- Function as a param

func add(_ a: Int, _ b : Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4,2)
function = subtract
function(4,2)

func printResult(_ function: (Int,Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a,b)
    print(result)
}

printResult(add, 10, 5)
printResult(subtract, 10, 5)




// 일급 객체로서의 함수 2

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
resultplus(3,4) // 7
calc("+")(3,4)

let resultminus = calc("-")
resultminus(3,4) // -1

let resulttimes = calc("*")
resulttimes(3,4) // 12

let resultdivide = calc("/")
resultdivide(3,4) // 0





// 일급 객체로서의 함수 3

func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr) // 4



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
        sCallBack() // 성공 함수를 실행한다.
    }
    return 100 / base
}

divide(base: 30, success: successThrough, fail: failThrough)
