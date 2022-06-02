import UIKit
import Foundation


struct Person {
    
    // 저장 프로퍼티
    var firstName: String {
    
        // 옵저버
        willSet {
            print("willSet: \(firstName) --> \(newValue)")
        }
        didSet {
            print("willSet: \(oldValue) --> \(firstName)")

        }
        
    }
    
    var lastName: String
    
    // 지연 저장 프로퍼티
    lazy var isPopular: Bool = {
        if fullName == "sojin Kim" {
            return true
        } else {
            return false
        }
        
    }()
    
    // 연산 프로퍼티
    var fullName: String {
        get{
            return "\(firstName) \(lastName)"
        }
        
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    
    // 타입 프로퍼티
    static let isAlien: Bool = false //타입 프로퍼티
    
}

var person = Person(firstName: "Kim", lastName: "sojin")

person.firstName
person.lastName


person.firstName = "Jason"
person.lastName = "Lee"

person.firstName
person.lastName

person.fullName
person.fullName = "Kim sojin"
person.fullName

Person.isAlien





