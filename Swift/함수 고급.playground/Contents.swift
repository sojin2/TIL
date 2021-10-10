/* 함수 */

import Swift

//MARK: - 매개변수 기본값

//함수의 매개변수에 값이 들어오지 않아도 자동으로 매개변수를 갖게된다.

//기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋습니다
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값...) -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

func greeting(friend: String, me: String = "sojin") {
    print("Hello \(friend)! I'm \(me)")
}

//매개변수 기본값을 가지는 매개변수는 생략할 수 있습니다.
greeting(friend: "haha") // Hello haha! I'm sojin
greeting(friend: "john", me: "eric") //Hello john! I'm eric


//MARK: - 전달인자 레이블

//전달인자 레이블을 함수를 호출할 때
//매개변수의 역할을 좀 더 명확하게 하거나
//함수 사용자의 입장에서 표현하고자 할 때 사용합니다.
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수2터입 기본값...) -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

//함수 내부에서 전달인자를 사용할 때에는 이름을 사용합니다.
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

//함수 외부에서 함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다.
greeting(to: "haha", from: "sojin") //Hello haha! I'm sojin

//MARK: - 가변 매개변수

//전달 받을 값의 개수를 알기 어려울 때 사용할 수 있습니다.
//가변 매개변수는 함수당 하나만 가질 수 있습니다.

//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수2타입...) -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "sojin", friends: "haha", "eric", "wing"))
//Hello ["haha","eric","wing"]! I'm sojin!

print(sayHelloToFriends(me: "sojin"))
//Hello []! I'm sojin!

/*
 위에 설명한 함수의 다양한 모양은 섞어서 사용 가능합니다
 */

//MARK: - 데이터 타입으로서의 함수

//스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어입니다.
//스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고
//매개변수를 통해 전달할 수도 있습니다

//MARK: 함수의 타입표현
//반환타입을 생략할 수 없습니다.
//(매개변수1타입, 매개변수2타입 ...) -> 반환타입

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric","sojin") //Hello eric! I'm sojin

someFunction = greeting(to:from:)
someFunction("eric","sojin") //Hello eric! I'm sojin

//타입이 다른 함수는 할당할 수 없습니다. (가변 매개변수 이기때문에)
//someFuntion = sayHelloToFriends(me: friends:)

func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

//Hello jenny! I'm mike
runAnother(function: greeting(to:from:))

//Hello jenny! I'm mike
runAnother(function: someFunction)
