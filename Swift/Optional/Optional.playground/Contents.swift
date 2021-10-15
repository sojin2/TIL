import UIKit
import Foundation

// Optional

// 옵셔널 Int
var optInt: Int?
optInt = 3

print("\(optInt)") // Optional(3)

// 옵셔널 String
var optString: String?
optString = "Swfit"

print("\(optString)") //Optional(

// 옵셔널 Array 타입
var optArr: [String]?
optArr = ["C" ,"Java", "Object-C"]
print("\(optArr)")

// 옵셔널 Dictionary
var optDic: [String: Int]?
optDic = ["국어": 98, "수학": 88, "영어":96]
print("\(optDic)")


//타입 변환하면서 옵셔널 처리하기
var acterName: String?
print(acterName)
let num = Int("123") //Optional(123)
print(num)
let num2 = Int("소진") // nil
print(num2)
let num3 = Double("235") // Optional(235.0)
print(num3)
//num은 Int형인데 들어가는 값이 String이어도 변환이 되서 들어갈 수도 있다. 그치만, "10안녕"과 같은 문장은 변환이되지 않아서 num값에 들어가지 못한다



// 고급 기능 4가지

// Forced unwrapping  > 억지로 박스를 까보기 optional에서 value 값을 강제로 빼낼때 사용
// Optional binding (lf let) > 부드럽게 박스를 까기 1
// Optional binding (guard) > 부드럽게 박스를 까기 2
// Nil coalescing > 박스를 까봤더니, 값이 없으면 디폴트 값을 주기

var carName: String? = "기아"

// ---> Forced unwrapping
print(carName!) // 강제로 까기
//
carName = nil
//print(carName!) // Error! 값이 없는데 억지로까려고 해서 오류가 남

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
printParaedInt(from: "100")
printParaedInt(from: "안녕안녕 반가워") // 변경 안됨



// ---> gurad ( if let보다 복잡성이 낮음 )

func printParasedInt(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안돼!")
        return
    }
    print(parsedInt)
}


printParasedInt(from: "100")
printParasedInt(from: "안녕안녕 반가워")


// Nil coalescing - carName이 nil이면 모델 S를 넣어줘

//carName = nil
//carName = "모델 3"

let myCarName: String = carName ?? "모델 S"

print(myCarName)


// 최애 음식 이름을 담는 변수를 작성 하고 (String?)
let favoriteFood: String? = "삼겹살"


// 옵셔널 바인딩을 이용해서 값을 확인해보기

// 강제
print(favoriteFood!)

// if let
if let foodName = favoriteFood {
    print(foodName)
} else {
    print("없어여")
}

func printFood (_ food: String?) {
    guard let unwrappedFood = food else {
        print("좋아하는 음식이 없어ㅜ")
        return
    }
    print("내가 좋아하는 음식은 \(unwrappedFood)이야!")

}
printFood(nil)
printFood("초밥")


// 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?

func printNickName (_ nickname: String?) {
    guard let unwrappedNickName = nickname else {
        print("닉네임이 없어ㅠㅠ")
        return
    }
        print("닉네임은 \(unwrappedNickName) 이야!")
    }

printNickName("우왕")
printNickName(nil)

/* 옵셔널 체이닝 */

//옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로 또 다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있습니다.
import Swift

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
//옵셔널 체이닝이 실행 후 결과 값이 nil일 수 있으므로 결과 타입도 옵셔널입니다.

//만약 우리집의 경비원의 강아지가 궁금하다면..?
sojin?.home = apart
sojin?.home?.guard = minsu
sojin?.home?.guard?.name //minsu
sojin?.home?.guard?.dog = "말티즈"
                    
//옵셔널 체이닝을 사용하지 않는다면...
func guardDog(owner:Person?) {
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

guardDog(owner: sojin)

//옵셔널 체이닝을 사용한다면
func guardDogWithOptionalChaining(owner: Person?) {
    if let guardDog = owner?.home?.guard?.dog {
        print("우리집 경비원의 강아지는 \(guardDog) 입니다!")
    } else {
        print("우리집 경비원은 강아지가 없어요.")
    }
}

guardDogWithOptionalChaining(owner: sojin)


// nil 병합 연산자
var guardDog: String

guardDog = sojin?.home?.guard?.dog ?? "진돗개"
print(guardDog) //진돗개


sojin?.home?.guard?.dog = nil

guardDog = sojin?.home?.guard?.dog ?? "진돗개"
print(guardDog) //진돗개


// protocol optional

@objc
protocol MsgDelegate {
    @objc optional func onReceive(new: Int)
}

class MsgCenter {
    var delegate: MsgDelegate?
    var newMsg: Int = 0

    func msgCheck() {
        if newMsg > 0 {
            self.delegate?.onReceive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
}

class Watch: MsgDelegate {
    var msgCenter: MsgCenter?
    
    
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    
    func onReceive(new: Int) {
        print("\(new)건의 메시지가 도착했습니다.")
    }
}



