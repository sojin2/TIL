/*클래스*/

/*
 클래스- 참조 타입
 %% 다중 상속 안 됨!! %%
 구조체 - 값 타입
 */

import Swift

//MARK: - 정의

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

