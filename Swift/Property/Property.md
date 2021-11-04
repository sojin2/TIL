# Property

**저장 프로퍼티**

- 입력된 값을 저장하거나 저장된 값을 제공하는 역할
- 상수 및 변수를 사용해서 정의 가능
- 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없음

**연산 프로퍼티**

- 특정 연산을 통해 값을 만들어 제공하는 역할
- 변수만 사용해서 정의 가능
- 클래스, 구조체, 열거형 모두에서 사용 가능

**인스턴스 프로퍼티** 

- 인스턴스에 소속되는 프로퍼티

**타입 프로퍼티**

- 클래스와 구조체 자체에 소속되어 값을 가짐

---

역할에 따른 분류

- 저장 프로퍼티(Stored Property)
- 연산 프로퍼티(Computed Property)

소속에 따른 분류

- 인스턴스 프로퍼티 (Instance Property)
- 타입 프로퍼티 (Type Property)

---

**프로퍼티 옵저버 (Property Observer)**

: 프로퍼티 값을 모니터링하기 위해

- 사용자가 정의한 특정 액션과 반응하도록 처리할 수 있습니다.
- 우리가 직접 정의한 저장 프로퍼티에 추가할 수 있으며, 슈퍼 클래스로부터 상속 받은 서브 클래스에서도 추가할 수 있습니다.

---

 

```swift
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
    static let isAlien: Bool = false
    
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
```
