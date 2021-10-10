//
//  main.swift
//  StructExm
//
//  Created by 김소진 on 2020/07/06.
//  Copyright © 2020 sojin. All rights reserved.
//

import Foundation
import Swift

//MARK: - 정의

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
