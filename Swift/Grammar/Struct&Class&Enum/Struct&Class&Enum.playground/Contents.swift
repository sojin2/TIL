//
//  main.swift
//  StructExm
//
//  Created by 김소진 on 2021/10/28.
//  Copyright © 2021 sojin. All rights reserved.
//

import Foundation
import Swift

//MARK: - struct

//struct 이름 {
//      /* 구현부 */
//}

//MARK: 프로퍼티 및 메서드
struct Sample {
    
    //프로퍼티 - 코드 블럭 안에 들어가는 인스턴스 변수 (어떤 타입 안에 들어가 있는 변수)
    var mutableProperty: Int = 100 //가변 프로퍼티
    let immutableProperty: Int = 100 //불변 프로퍼티
    
    static var typeProperty: Int = 100 //타입 프로퍼티
    
    
    //인스턴스 프로퍼티
    //인스턴스 메서드
    func instanveMethod() {
        print("inatance method")
    }
    
    //타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

//MARK: 구조체 사용

//가변 인스턴스
var mutable: Sample = Sample()

//mutable.mutableProperty = 200 - 정상 작동 : 가변 프로퍼티이므로!
//mutable.immutableProperty = 200 - 오류 : 불변 프로퍼티 이므로!

//붎변 인스턴스
let immutable: Sample = Sample()

//mutable.mutableProperty = 200
//mutable.immutavleProperty = 200

//타입 프로퍼티 및 메서드
//메서드 - 코드 블럭 안에 들어가는 함수 ( 어떤 타입 안에 들어가 있는 함수)
Sample.typeProperty = 300 //sample이라는 타입에서 사용할수있는 타입 프로퍼티
Sample.typeMethod() //type method

//mutable.typeProperty = 400
//mutable.typeMethod()

//MARK: - 학생 구조체

struct Student {
    var name : String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}


Student.selfIntroduce() //학생 타입 입니다.

var yegom: Student = Student()
yegom.name = "yegom"
yegom.class = "스위프트"
yegom.selfIntroduce() //저는 스위프트반 yegom입니다.


let jina:Student = Student()

//불변 인스턴스이므로 프로퍼티 값 변경 불가
//컴파일 오류 발생
//jin.name = "jina"
jina.selfIntroduce()//저는 Swift반 unknown입니다.


//
//struct Point {
//var x = 0
//var y = 0
//
//// 컴파일 에러남.
//func moveTo(x: Int, y: Int) {
//    self.x = x
//    self.y = y
//  }
//
//// 정상 실행
//mutating func moveTo2(x: Int, y: Int) {
//    self.x = x
//    self.y = y
//  }
//
//}




protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                // 연료가 부족해지면 델리게이트의 lackFule 메소드를 호출한다.
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                // 연료가 가득차면 델리게이트의 fullFuel 메소드를 호출한다.
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    // 연료펌프를 가동한다.
    func startPump( ) {
        while (true) {
            if (self.fuelGage > 0) {
                self.jetFuel()
            } else {
                break
            }
        }
    }
    
    // 연료를 엔진에 분사한다. 분사할 때마다 연료 게이지의 눈금은 내려간다.
    func jetFuel( ) {
        self.fuelGage -= 1
    }
}

class Car : FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    
    // fulePump가 호출하는 메소드입니다.
    func lackFuel() {
        // 연료를 보충한다.
    }
    
    // fulePump가 호출하는 메소드 입니다.
    func fullFuel() {
        // 연료 보충을 중단한다.
    }
    
    // 자동차에 시동을 겁니다.
    func start() {
        fuelPump.startPump()
    }
}


//MARK: - Class


// class 이름 {
//    /*구현부*/
//}

//MARK: 프로퍼티 및 메서드

class Sample {
    var mutableProperty: Int = 100 //가변 프로퍼티
    let immutableProperty: Int = 100 //불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    //재정의 가능 타입 메서드 -  class
    class func classMethod() {
        print("type method - class")
    }
    
}


//MARK: 클래스 사용

/*
 아래에서 var와 let으로 각각 선언되어도 내부 프로퍼티는 값 변경이  가능하다.
 */


var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200

let immutableReference : Sample = Sample ()

immutableReference.mutableProperty = 200 //let은 불변인데 class는 상관 없이 변경 가능하다.
//immutableReference.immutableProperty = 200 //하지만 class가아닌 뒤의 immutableProperty는 불변이므로 실행하면 오류가 뜬다.

//immutableReference = mutableReference


//타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutableReference.typeProperty = 400
//mutableReference.typeMethod()


//MARK: - 학생 클래스

class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    class func selfIntroduce() {
        print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

Student.selfIntroduce() //학생타입입니다.

var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce() //저는 스위프트반 yagom입니다.

let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() //저는 Swift반 jina입니다.
//let으로 선언했음에도 불구하고 변경이 가능하다.



//MARK: - Enum

//enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의합니다.
//각 case는 소문자 카멜케이스로 정의 합니다.
//각 case는 그 자체가 고유의 값입니다.

//enum 이름 {
//    case 이름1,
//    case 이름2,
//    case 이름3,이름4,이름5
//    ...
//}

//MARK: 열거형 사용

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

//Weekday가 day에 타입으로 선언되어있음
//Weekday는 열거형 타입 이름.케이스 이름 으로 선언되어있음
var day: Weekday = Weekday.mon
day = .tue

print(day)

switch day { //day라는 열거형 값
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat,.sun:
    print("신나는 주말!!")
}

//MARK: - 원시값

//C언어의 enum처럼 정수값을 가질 수도 있습니다.
//rawValue를 사용하면 됩니다.
//case별로 각각 다른 값을 가져야 합니다.
//값은 자동으로 1씩 증가 한다. grape에 1을 넣지 않아도 자동으로 1이 된다.

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    //case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
//Fruit.peach.rawValue == 2

//정수 타입 뿐만 아니라
//Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있습니다.

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
//School.middle.rawValue == 중등

print("School.university.rawValue == \(School.university.rawValue)")
//School.middle.rawValue == university - 안에 값이 없으면 case의 이름을 그대로 출력한다.

//MARK: 원시값을 통한 초기화

//rawValue를 통해 초기화 할 수 있습니다.
//rawValue가 case에 해당하지 않을 수 있으므로
//rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입입니다.

//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
} //rawValue 5에 해당하는 케이스가 없습니다.

//MARK: 메서드
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov

    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
