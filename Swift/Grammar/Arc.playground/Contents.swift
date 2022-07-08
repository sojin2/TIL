import UIKit

/*
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// Person 클래스 타입의 옵셔널 변수 선언
var reference1: Person?
var reference2: Person?
var reference3: Person?

// 모두 초기값 nil
reference1
reference2
reference3

// reference1이 Person 인스턴스 참조하도록 함
// 참조 횟수 : +1
reference1 = Person(name: "Sojin Appleseed")
// Prints "Sojin Appleseed is being deinitialized"

reference1
reference2
reference3


// 다른 변수도 reference1을 참조
reference2 = reference1
reference3 = reference1

// 모두 reference1이 참조하고있는 Person인스턴스를 참조하고 있음
// 참조 횟수 : 3 (+2)
reference1
reference2
reference3


// nil 처리하여 reference1,2 참조 해지
// 참조 횟수 : 1 (-2: reference3만 참조중)
reference1 = nil
reference2 = nil

reference1
reference2
reference3


// reference3 참조 해지 / ARC가 Person 인스턴스 메모리에서 해지
// 참조 횟수 : 0 (-1)
reference3 = nil
// Prints "Sojin Appleseed is being deinitialized"

 */
/*
// Strong Reference Cycles Between Class Instances

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

// 변수 선언
var sojin: Person?
var unit4A: Apartment?

// 인스턴스 할당
sojin = Person(name: "Sojin Appleseed")
unit4A = Apartment(unit: "4A")

sojin!.apartment = unit4A
unit4A!.tenant = sojin

sojin = nil
unit4A = nil

*/

/*
// Resolving Strong Reference Cycles Between Class Instances

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var sojin: Person?
var unit4A: Apartment?

sojin = Person(name: "Sojin Appleseed")
unit4A = Apartment(unit: "4A")

sojin!.apartment = unit4A
unit4A!.tenant = sojin

sojin = nil
// Prints "Sojin Appleseed is being deinitialized"

unit4A = nil
// Prints "Apartment 4A is being deinitialized"
*/

/*

// Unowned Reference

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var sojin: Customer?

sojin = Customer(name: "Sojin Appleseed")
sojin!.card = CreditCard(number: 1234_5678_9012_3456, customer: sojin!)

sojin = nil
// Prints "Sojin Appleseed is being deinitialized"
// Prints "Card #1234567890123456 is being deinitialized"

*/

/*
// Unowned References and Implicitly Unwrapped Optional Properties

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Korea", capitalName: "seoul")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Korea's capital city is called seoul"

*/

/*
// Strong Reference Cycles for Closures

class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// Prints "<h1>some default text</h1>"

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"

paragraph = nil

*/

/*

// Weak and Unowned References

class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"

paragraph = nil
// Prints "p is being deinitialized"

*/

//Defining a Capture List

lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}

lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // closure body goes here
}


