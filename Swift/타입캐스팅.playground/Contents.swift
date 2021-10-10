///* 타입 캐스팅*/
//
//// 스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도
//// 또는 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도로 사용합니다.
//// ia, as를 사용합니다.
//
//import Swift
//
///*
//let someInt: Int = 100
//let someDouble: Double = Double(someInt)
//*/
//
//// 타입 캐스팅을 위한 클래스 정의
//class Person {
//    var name: String = ""
//    func breath() {
//        print("숨을 쉽니다")
//    }
//}
//
//class Student: Person {
//    var school: String = ""
//    func goToSchool() {
//        print("등교를 합니다.")
//    }
//}
//
//class UniversityStudent: Student {
//    var major: String = ""
//    func goToMT() {
//        print("멤버쉽 트레이닝을 갑니다.")
//    }
//}
//
//var yagom: Person = Person()
//var hana: Student = Student()
//var jason: UniversityStudent = UniversityStudent()
//
////MARK: - 타입 확인
////is를 사용하여 타입을 확인합니다.
//
//var result: Bool
//
//result = yagom is Person // true
//result = yagom is Student // false
//result = yagom is UniversityStudent // false
//
//result = hana is Person //true
//result = hana is Student // true
//
//result = jason is Person //true
//result = jason is Student // true
//result = jason is UniversityStudent // true
//
//if yagom is UniversityStudent {
//    print("yagom은 대학생입니다")
//} else if yagom is Student {
//    print("yagom은 학생입니다")
//} else if yagom is Person {
//    print("yagom은 사람입니다")
//} // yagom은 사람입니다
//
//switch jason {
//case is Person:
//    print("jason은 사람입니다")
//case is Student:
//    print("jason은 학생입니다")
//case is UniversityStudent:
//    print("jason은 대학생입니다")
//default:
//    print("jason은 사람도, 학생도, 대학생도 아닙니다")
//} // json은 사람입니다.
//
//switch jason {
//case is UniversityStudent:
//    print("jason은 대학생입니다")
//case is Student:
//    print("jason은 학생입니다")
//case is Person:
//    print("jason은 사람입니다")
//default:
//    print("jason은 사람도, 학생도, 대학생도 아닙니다")
//} // json은 대학생입니다.
//
//
////MARK: - 업 캐스팅
//// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다.
//// Any 혹은 AnyObject로도 타입 정보를 변환할 수 있습니다.
//// 암시적으로 처리되므로 생략해도 무방합니다.
//
//var mike: Person = UniversityStudent() as Person
//var jenny: Student = Student()
////var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
//var jina: Any = Person() //as Any 생략가능
//
////MARK: - 다운 캐스팅
//// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줍니다.
//
//// MARK: 조건부 다운 캐스팅
//// as?
//
//var optionalCasted: Student?
//
//optionalCasted = mike as? UniversityStudent
//optionalCasted = jenny as? UniversityStudent // nill
//optionalCasted = jina as? UniversityStudent //nil
//optionalCasted = jina as? Student //nill
//
////MERK: 강제 다운 캐스팅
////as!
//
//var forcedCasted: Student
//
//optionalCasted = mike as! UniversityStudent
////optionalCasted = jenny as! UniversityStudent // 런타임 오류
////optionalCasted = jina as! UniversityStudent // 런타임 오류
////optionalCasted = jina as! Student // 런타임 오류
//
////활용
//func doSomethingWithSwitch(someone: Person) {
//    switch someone {
//    case is UniversityStudent:
//        (someone as! UniversityStudent).goToMT()
//    case is Student:
//        (someone as! Student).goToSchool()
//    case is Person:
//        (someone as! Person).breath()
//    }
//}
//
//doSomethingWithSwitch(someone: mike as Person)
//// 멤버쉽 트레이닝을 갑니다.
//
//doSomethingWithSwitch(someone: mike)
//// 멤버쉽 트레이닝을 갑니다.
//
//doSomethingWithSwitch(someone: jenny)
//// 등교를 합니다
//
//func doSomething(someone: Person) {
//    if let UniversityStudent = someone as? UniversityStudent {
//        UniversityStudent.goToMT()
//    } else if let student = someone as? Student {
//        student.goToSchool()
//    } else if let person = someone as? Person {
//        person.breath()
//    }
//}
//
//doSomething(someone: mike as Person)
//// 멤버쉽 트레이닝을 갑니다.
//
//doSomething(someone: mike)
//// 멤버쉽 트레이닝을 갑니다.
//
//doSomething(someone: jenny)
//// 등교를 합니다
//
//doSomething(someone: yagom)
//// 숨을 쉽니다
//
//
//
//
//
//
//class Vehicle {
//    var currentSpeend = 0.0
//
//    func accelerate() {
//        self.currentSpeend += 1
//    }
//}
//
//class Car: Vehicle {
//    var gear: Int {
//        return Int(self.currentSpeend / 20) + 1
//    }
//
//    func wiper() {
//        // 창을 닦습니다.
//    }
//}
//
//let trans: Vehicle = Car()
//
//
//// let car: Car = Vehicle // Error!
//
//
////class Car: Vehicle {
////    // 아무 내용도 작성하지 않음
////}
////
////let car: Car = Vehicle() //Error!
//
//
//class SUV: Car {
//    var fourWheel = false
//}
//
//let jeep: Vehicle = SUV()
//
//
//
//
//func move(param: SUV) {
//    param.accelerate()
//}
//
//func move(param: Vehicle) {
//    param.accelerate()
//}
//
//
//var list = [SUV]()
//list.append(SUV())
//
//
//
////var list = [Vehicle]()
////
////list.append(Vehicle())
////list.append(Car())
////list.append(SUV())
//
//
////타입 비교 연산
//
//SUV() is SUV
//SUV() is Car
//SUV() is Vehicle
//
//Car() is Vehicle
//Car() is SUV
//
//
//
//
//let myCar: Vehicle = SUV()
//
//if myCar is SUV {
//    print("myCar는 SUV 타입입니다.")
//} else {
//    print("myCar는 SUV 타입이 아닙니다.")
//}
//
//
//
//let newCar: Vehicle = Car()
//
//if newCar is SUV {
//    print("myCar는 SUV 타입입니다.")
//} else {
//    print("myCar는 SUV 타입이 아닙니다.")
//}
//
//
//
// // 타입 캐스팅 연산
//
//let someCar: Vehicle = SUV()
//
//// 업
//let anyCar: Car = SUV()
////let anyVehicle: anyCar as Vehicle
//
//// 다운
//let anySUV = anyCar as? SUV
//if anySUV != nil {
//    print("\(anySUV!) 캐스팅이 성공하였습니다.")
//}
//
//
//if let anySUV = anyCar as? SUV {
//    print("\(anySUV) 캐스팅이 성공하였습니다.")
//}
//
////AnyObject
//
//// 선언된 변수나 상수에 할당 가능
//var allCar: AnyObject = Car()
//allCar = SUV()
//
//// 모든 종류의 클래스 반환 가능
//func move(_ param: AnyObject) -> AnyObject {
//    return param
//}
//
//move(Car())
//move(Vehicle())
//
//
//// 모든 클래스 저장 가능
//var list1 = [AnyObject]()
//list1.append(Vehicle())
//list1.append(Car())
//list1.append(SUV())
//
//
//
//let obj: AnyObject = SUV()
//
//if let suv = obj as? SUV {
//    print("\(suv) 캐스팅이 성공하였습니다.")
//}
//
//
//
////any
//
////var vlaue: Any = "Sample String"
////value = 3
////vlaue = false
////value = [1,3,4,7,9]
////value = {
////    print("함수가 실행됩니다.")
////}
//
//
//func name(_ param: Any) {
//    print("\(param)")
//}
//
//name(3)
//name(false)
//name([1,3,4,7,9])
//name {
//    print(">>>>")
//} // (Function)
//
//
//var rows = [Any]()
//rows.append(3)
//rows.append(false)
//rows.append([1,3,4,7,9])
//rows.append {
//    print(">>>>")
//}





class MediaItem {

    var name: String

    init(name: String) {

        self.name = name

    }

}

class Movie: MediaItem {

    var director: String

    init(name: String, director: String) {

        self.director = director

        super.init(name: name)

    }

}


class Song: MediaItem {

    var artist: String

    init(name: String, artist: String) {

        self.artist = artist

        super.init(name: name)

    }

}

let library = [



    Movie(name: "죽은 시인의 사회", director: "피터 위어"),

    Song(name: "창공", artist: "김준석"),

    Movie(name: "인터스텔라", director: "크리스토퍼 놀란"),

    Movie(name: "공범자들", director: "최승호")

]



// is
var movieCount = 0

var songCount = 0


for item in library {

    if item is Movie {

        movieCount += 1

    } else if item is Song {

        songCount += 1

    }

}

print("Media library는 \(movieCount)개의 영화와  \(songCount)개의 노래가 있어요!");



// 다운 캐스팅

for item in library {



    if let movie = item as? Movie {

        print("Movie: \(movie.name), dir. \(movie.director)")

    } else if let song = item as? Song {

        print("Song: \(song.name), by \(song.artist)")

   }

}

/*



Movie: 죽은 시인의 사회, dir. 피터 위어

Song: 창공, by 김준석

Movie: 인터스텔라, dir. 크리스토퍼 놀란

Movie: 공범자들, dir. 최승호

 */



var things = [Any]()
things.append(0)

things.append(3.9)

things.append(42)

things.append(3.141592)

things.append("sojin")

things.append((3.0, 5.0))

things.append(Movie(name: "대장 김창수", director: "이원태"))

things.append({ (name: String) -> String in "Hello, \(name)" })




for thing in things {

    switch thing {


    case 0 as Int:

        print("Int타입 0")

    case 0 as Double:

        print("Double 타입 0")

    case let someInt as Int:

        print("0이 아닌 Int \(someInt)")

    case let someDouble as Double where someDouble > 0:

        print("양의 Double타입 \(someDouble)")

    case is Double:

        print("Double타입 출력 안 할래")

    case let someString as String:

        print("String값은 \"\(someString)\"")

    case let (x, y) as (Double, Double):

        print("x와 y좌표는 \(x), \(y)")

    case let movie as Movie:

        print("영화 이름은 \(movie.name), dir. \(movie.director)")

    case let stringConverter as (String) -> String:

        print(stringConverter("소진"))

    default:

        print("이외..")

    }

}


protocol Flyable { func fly() }

extension Flyable {
    func fly() {
        print("푸드득 푸드득")
    }
}

protocol Runable { func run() }

extension Runable {
    func run() {
        print("후다닥 후다닥")
    }
}

protocol Swimable { func swim() }
extension Swimable {
    func swim() {
        print("어푸 어푸")
    }
}

protocol Talkable { func talk() }
extension Talkable {
    func talk() {
        print("재잘재잘 쪼잘쪼잘")
    }
}

struct Bird: Flyable, Talkable { }

let bird = Bird()
bird.fly()
bird.talk()

struct Person: Runable, Swimable, Talkable { }

let person = Person()
person.run()
person.talk()
person.swim() 
