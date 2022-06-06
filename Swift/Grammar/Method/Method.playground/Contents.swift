
// MARK: - Method

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
    
    // Instance Method
    func remainStudent() -> Int {
        let remainStudent = maxStudents - numOfRegistered
        return remainStudent
    }
    
    // 수정 가능한 메소드
    mutating func register() {
        numOfRegistered += 1
    }
    
    // Type Method
    static let target: String = "Anybody"
    static func academy() -> String {
        return "소진학원"
    }
}

var lec = Lecture(title: "iOS Basic")

lec.register()
lec.register()
lec.register()


lec.remainStudent()
Lecture.target
Lecture.academy()

// Extension

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20) //20

// extension 확장 (제곱, 반값)
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.square(value: 3) // 9
Math.square(value: 10) // 100


let value: Int = 3

// Swift에 저장되어있는 구조체도 확장 가능 (제곱, 반값)
extension Int {
    func square() -> Int {
        return self * self
    }
    func half() -> Int {
        return self / 2
    }
}

value.square()
value.half()

