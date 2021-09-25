/* 프로토콜 */


//프로토콜을 특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜 라이저 등의 요구 사항을 정의합니다.

//구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서 프로토콜의 요구사랑을 실제로 구현할 수 있습니다.
//어떤 프로토콜의 요구사항을 모두 따르는 타입은 그 '프로토콜을 준수한다(Conform)'고 표현합니다.
//프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 기능을 모두 구현해야 합니다.

import Swift

// MARK: - 정의 문법

//protocol 프로토콜 이름 {
//    /* 정의부 */
//}

protocol Talkable {
    
    // 프로퍼티 요구
    // 프로퍼티 요구는 항상 var 키워드를 사용합니다
    // get은 읽기만 가능해도 상관 없다는 뜻이며 get과 set을 모두 명시하면 읽기 쓰기 모두 가능한 프로퍼티여야 합니다.
    var topic: String { get set }
    var language: String { get }
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

//MARK: - 프로토콜 채택 및 준수

//Person 구조체는 Talkable 프로토콜을 채택했습니다.
struct Person: Talkable {
    var topic: String
    let language: String
    
    // 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능합니다.
    // var language: String { return "한국어" }
    
    // 물론 읽기, 쓰기 프로퍼티도 연상 프로퍼티로 대체할 수 있습니다.
    // var subject: String = ""
    // var topic: String {
    //      set {
    //          self.subject = newValue
    //      get {
    //          return self.subject
    //       }
    //}
    
    func talk() {
        print(" \(topic)에 대해 \(language)로 말합니다.")
    }
    
    init(topic: String, language: String ){
        self.topic = topic
        self.language = language
    }
}

//MARK: - 프로토콜 상속

// 프로토콜은 클래스와 다르게 다중상속이 가능합니다.

//protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
//    /*정의부*/
//}

protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}

//MARK: 클래스 상속과 프로토콜

// 클래스에서 상속과 프로토콜 채택을 동시에 하려면 상속받으려는 클래스를 먼저 명시하고 그 뒤에 채택할 프로토콜 목록을 작성합니다.
class SuperClass: Readable {
    func read() {
        print("read")
    }
}

class SubClass: SuperClass, Writeable, ReadWriteSpeakable {
    func write() {
        print("write")
    }
    
    func speak() {
        print("speak")
    }
}

//MARK: - 프로토콜 준수 확인
// 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있습니다.
// is, as 연산자 사용

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable //false

someAny = sub
someAny is Readable //true
someAny is ReadSpeakable //true

someAny = sup

if let someReadable: Readable = someAny as? ReadSpeakable {
    someReadable.read()
} //read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
} //동작하지 않음

someAny = sub

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
} //read


protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}


struct RubyMember: SomePropertyProtocol {
    var name = "홍길동"
    var description: String {
        return "Name:\(self.name)"
    }
}

protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyService: SomeMethodProtocol {
    
    func execute(cmd: String) {
        
        if cmd == "start" {
            
            print("실행합니다.")
            
        }
    }
    
    func showPort(p: Int) -> String {
        
        return "Port : \(p)"
        
    }
}

protocol NewMethodProtocol {
    mutating func execute(cmd command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}

struct RubyNewService: NewMethodProtocol {
    func execute(cmd command: String, desc: String) {
        if command == "start" {
            print("\(desc)를 실행합니다.")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo: \(desc)"
    }
}

struct RubyNewService2: NewMethodProtocol {
    func execute(cmd comm: String, desc d: String) {
        if comm == "start" {
            print("\(d)를 실행합니다")
        }
    }
        
        func showPort(p: Int, memo description: String) -> String {
            return "Port: \(p), Memo: \(description)"
        }
    }

 
protocol MService {
    mutating func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyMService: MService {
    var paramCommand: String?
    
    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String{
        return "Port: \(p), now command: \(self.paramCommand!)"
    }
}

struct RubyMService2: MService {
    var paramCommand: String?
    
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port: \(p), now command : \(self.paramCommand!)"
    }
}

class RubyThread: MService {
    var paramCommand: String?
    
    func execute(cmd: String) {
        self.paramCommand = cmd
        
        if cmd == "start" {
             print("실행합니다")
        }
    }
    
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command: \(self.paramCommand!)"
    }
}




protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultValue() -> String
}


struct TypeStruct: SomeTypeProperty {
    
    static var defaultValue = "default"
    
    static func getDefaultValue() -> String {
        
        return defaultValue
    
    }
}


class ValueObject: SomeTypeProperty {
    static var defaultValue = "default"
    class func getDefaultValue() -> String {
        return defaultValue
    }
}


// 초기화 메소드

protocol SomeInitProtocol {
    init()
    init(cmd: String)
}

struct SInt: SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "start"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
}

class CInit: SomeInitProtocol {
    var cmd: String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}



//protocol Init {
//    init()
//}

//class Parent {
//    init() {
//
//    }
//}
//
//class child: Parent, Init {
//    override required init() {
//
//    }
//}


protocol Init {
    func getValue()
}

class Parent {
    func getValue() {
        
    }
}

class Child: Parent, Init {
    override func getValue() {
        
    }
}

//struct MultiImplement: NewMethodProtocol, SomeInitProtocol {
//    var cmd: String
//
//    init() {
//        self.cmd = "default"
//    }
//
//    init(cmd: String) {
//        self.cmd = cmd
//    }
//
//    mutating func execute(cmd command: String, desc: String) {
//        self.cmd = cmd
//        if cmd == "start" {
//            print("시작합니다")
//        }
//    }
//
//    func showPort(p: Int, memo desc: String) -> String {
//        return "Port : \(p), Memo : \(desc)"
//    }
//
//}

// 타입으로서의 프로토콜

//protocol Wheel {
//    func spin()
//    func hold()
//}


//class Bicycle: Wheel {
//    var moveState = false
//
//    func spin() {
//        self.pedal()
//    }
//
//    func hold() {
//        self.pullBreak()
//    }
//
//    func pedal() {
//        self.moveState = true
//    }
//
//    func pullBreak() {
//        self.moveState = false
//    }
//}
//
//let trans = Bicycle()
//trans.moveState //false
//trans.pedal()
//trans.pullBreak()
//trans.spin()
//trans.hold()
//
//// 타입 어노테이션에 프로토콜타입을 사용하여 wheel 타입상수에 할당
//
//let trans2: Wheel = Bicycle()
//
////클래스 본래의 타입인 Bicycle이 아니라 Wheel 타입의 상수에 할당된 trans가 사용할 수 있는 프로퍼티나 메소드
//trans2.spin()
//trans2.hold()


// 확장 구문

class Man {
    var name: String?
    
    init(name: String = "홍길동"){
        self.name = name
    }
}

protocol Job {
    func doWork()
}

extension Man:Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다.")
    }
}

let man = Man(name : "개발자")
man.doWork()


// 상속 구문
protocol A {
    func doA()
}

protocol B {
    func doB()
}


protocol C: A, B {
//    func doA()
//    func doB()
    func doC()
}

class ABC: C {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func doC(){
        
    }
}

let abc: C = ABC()
// abc.doA(), abc.doB(), abc.doC()

let a: A = ABC()
// a.doA()

let ab: A & B = ABC()
// ab.doA() , ab.doB()

let abc2: A & B & C = ABC()
// abc2.doA(), abc2.doB(), abc2.doC()

func foo(abc: C) { }
foo(abc: ABC())

func boo(abc: A & B) { }
boo(abc: ABC())



abc is C //true
abc is A & B //true
abc is A // true
abc is B //true
a is C //true
a is B //true
ab is C //true
abc2 is A & B & C //true

protocol Machine {
    func join()
}

protocol Wheel: Machine {
    func lotate()
    
    init(name: String, currentSpeed: Double)
}

class Vehicle {
    var currentSpeed = 0.0
    var name = ""
    
    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
}

class Car: Vehicle, Wheel {
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        
    }
    
    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}

class Carpet: Vehicle, Machine {
    func join() {
        
    }
}

var translist = [Vehicle]()
translist.append(Car(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj = trans as? Wheel {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패했습니다." )
    }
}

import Foundation

@objc
protocol MsDelegate {
    @objc optional func onReceive(new:Int)
}


class MsgCenter {
    var delegate: MsDelegate?
    var newMsg: Int = 0
    
    func msgCheck() {
        if newMsg > 0 {
            self.delegate?.onReceive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
}

class Watch: MsDelegate {
    var msgCenter: MsgCenter?
    
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    
    func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
}
