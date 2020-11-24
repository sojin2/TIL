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





