import UIKit

// 구조체

struct Sample {
    //Property
    var sampleProperty: Int = 10 // 가변 프로퍼티
    let fixedSampleProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty: Int = 1000 // 타입 프로퍼티
    
    //Construct
    
    //Method /Function
    func instanceMethod() {
        print("instance method")
        
    }
    
    static func typeMethod() {
        print("type method")
    }
    
}

//구조체 사용
var samp: Sample = Sample()
print(samp.sampleProperty)
samp.sampleProperty = 20

print(samp.sampleProperty)
print(samp.fixedSampleProperty)
//samp.fixedSampleProperty = 20 error=

samp.instanceMethod()

var samp1: Sample = Sample()
print(samp1.sampleProperty)
 
print(Sample.typeProperty)
Sample.typeMethod()

// 학생 구조체
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce() {
        print("저는\(self.class)반 \(name)입니다.")
    }
}
Student.selfIntroduce()

var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

var cathy: Student = Student()
cathy.name = "jina"
cathy.class = "Swift"
cathy.selfIntroduce()

class SampleC {
    var sampProperty: Int = 20
    let fixedSampProperty: Int = 100
    static var typeProperty: Int = 100
    
    func instanceMethod() {
        print("instance method")
    }
}

var sampC: SampleC = SampleC()
sampC.sampProperty = 50

// class와 Struct의 사용
// Class와 Struct는 프로그램의 코드를 조직화 하기위해 일반적으로 사용합니다.

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    var resolution: Resolution = Resolution()
}

let someVideoMode = VideoMode()
someVideoMode.resolution.width = 1920

print("The width of someVideoModel is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)
var cinema = vga
print("cinema is now \(cinema.width) pixels wide")


// 시험 점수 총점 및 평균 출력
class Exam {
    var name = ""
    var score: [Int] = []
    var tot = 0, avg = 0
    
    func input(_ nn: String, _ jj: Int...) {
        name = nn
        score = jj
        calc()
        result()
    }
    
    func calc() {
        tot = 0
        for i in score {
            tot += i
        }
        avg = tot / score.count
    }
    
    func result() {
        print(name, score, tot, avg)
    }
}

let st1: Exam = Exam()
let st2: Exam = Exam()
let st3: Exam = Exam()
let st4: Exam = Exam()

st1.input("유비", 77,78,71)
st2.input("관우", 57,58,51)
st3.input("장비", 47,48,41)
st1.input("조조", 77,78)


// Overloading
// 도형의 넓이와 둘레를 계산하는 Class

class Shape {
    var kind = ""
    var area = 0.0
    var border = 0.0
    
    func input(_ r: Double) {
        kind = "원"
        let pi = 3.14
        area = pi * r * r
        border = 2 * pi * r
        result()
    }
    
    func input(_ w: Double, _ h: Double) {
        kind = "직사각형"
        area = w * h
        border = (w + h) * 2
        result()
    }
    
    func input(_ w: Double,_ l: Double, _ h: Double) {
        kind = "직각삼각형"
        area = w * h / 2
        border = w + h + 1
        result()
    }
    
    func result() {
        print("\(kind) : \(Int(area)), \(Int(border))")
    }
    
}

let sh1: Shape = Shape()
sh1.input(5)
sh1.input(5, 6)
sh1.input(5,6,7)


// 생성자를 이용
class Shape1 {
    var area = 0.0
    let pi = 3.14
    
    init() {
        print("계산 시작")
    }
    
    init(radius: Double) {
        area = radius * radius * pi
        result()
    }
    
    func input(_ r: Double) {
        area = pi * r * r
        result()
    }
    func result() {
        print("원의 면적은 \(Int(area))입니다.")
    }
}

let sh2: Shape1 = Shape1()
sh2.input(5)

let sh3: Shape1 = Shape1(radius: 5.0)

// Shape Class를 생성자를 통해 계산
class Shape2 {

    var kind = ""
    var area = 0.0
    var border = 0.0
    
    init(_ r: Double) {
        kind = "원"
        let pi = 3.14
        area = pi * r * r
        border = 2 * pi * r
        result()
    }
    
    init(_ w: Double, _ h: Double) {
        kind = "직사각형"
        area = w * h
        border = (w + h) * 2
        result()
    }
    
    init(_ w: Double,_ l: Double, _ h: Double) {
        kind = "직각삼각형"
        area = w * h / 2
        border = w + h + 1
        result()
    }
    
    func result() {
        print("\(kind) : \(Int(area)), \(Int(border))")
    }

    
    
}
let sh4: Shape2 = Shape2(5)
let sh5: Shape2 = Shape2(5,6)
let sh6: Shape2 = Shape2(5,6,7)


// Extension
// Extension은 구조체, 클래스, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능

// Extension으로 Int 연산에 Property를 추가

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)
print(1.isOdd)

var number: Int = 3
print(number.isEven)


