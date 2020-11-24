import UIKit
import Swift

let age: Int = 10

"안녕하세요! 저는 \(age)살입니다."
//== "안녕하세요! 저는 10살입니다"

"안녕하세요! 저는 \(age+13)살입니다."
//== "안녕하세요 저는 21살입니다."

print("안녕하세요! 저는 \(age + 13)살입니다.")

print("\n####################\n")

class Person {
    var name: String  = "sojin"
    var age: Int = 21
}

let sojin: Person = Person()

print(sojin)
//딘순하게 person의 인스턴스라는 것만 보임

print("\n####################\n")

dump(sojin)

//복잡한 클래스 인스턴스나 구조체 인스턴스(인스터런스?)를 표현할때 좋은 방법이 될 수 있음

