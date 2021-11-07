import UIKit

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToClass() {
        print("수업을 갑니다.")
    }
}

var sojin: Person = Person()
var minsu: Student = Student()
var jimin: UniversityStudent = UniversityStudent()

//MARK: - 타입 확인
//is를 사용하여 타입을 확인합니다.

var result: Bool

result = sojin is Person // true
result = sojin is Student // false
result = sojin is UniversityStudent // false

result = minsu is Person //true
result = minsu is Student // true

result = jimin is Person //true
result = jimin is Student // true
result = jimin is UniversityStudent // true

if sojin is UniversityStudent {
    print("sojin은 대학생입니다")
} else if sojin is Student {
    print("sojin은 학생입니다")
} else if sojin is Person {
    print("sojin은 사람입니다")
} // yagom은 사람입니다

switch minsu {
case is Person:
    print("minsu은 사람입니다")
case is Student:
    print("minsu은 학생입니다")
case is UniversityStudent:
    print("minsu은 대학생입니다")
default:
    print("minsu은 사람도, 학생도, 대학생도 아닙니다")
} // json은 사람입니다.

switch jimin {
case is UniversityStudent:
    print("jimin은 대학생입니다")
case is Student:
    print("jimin은 학생입니다")
case is Person:
    print("jimin은 사람입니다")
default:
    print("jimin은 사람도, 학생도, 대학생도 아닙니다")
} // json은 대학생입니다.


//MARK: - 업 캐스팅
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다.
// Any 혹은 AnyObject로도 타입 정보를 변환할 수 있습니다.
// 암시적으로 처리되므로 생략해도 무방합니다.

var mike: Person = UniversityStudent() as Person // Person으로 업 캐스팅
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류 (다운캐스팅이므로)
var jina: Any = Person() //as Any 생략가능

//MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줍니다.
 
// MARK: 조건부 다운 캐스팅
// as?

var optionalCasted: Student? //반환 타입이 옵셔널 타입

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil


optionalCasted = jina as? UniversityStudent //nil
optionalCasted = jina as? Student //nil

//MERK: 강제 다운 캐스팅
//as!

var forcedCasted: Student //옵셔널이 아니라서 nil이 안 뜨고 바로 죽어버림

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류

//활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent: //is는 확인만 함
        (someone as! UniversityStudent).goToClass() //그래서 직접 값을 가져와서 캐스팅해줘야됨
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomethingWithSwitch(someone: mike)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomethingWithSwitch(someone: jenny)
// 등교를 합니다

func doSomething(someone: Person) {
    if let UniversityStudent = someone as? UniversityStudent { //캐스팅과 동시에 인스턴스를 반환받아서 언랩핑가능
        UniversityStudent.goToClass()
    } else if let student = someone as? Student { //someone as? Student을 받아 온 후 처리
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomething(someone: mike)
// 멤버쉽 트레이닝을 갑니다 신남!

doSomething(someone: jenny)
// 등교를 합니다

doSomething(someone: sojin)
// 숨을 쉽니다



