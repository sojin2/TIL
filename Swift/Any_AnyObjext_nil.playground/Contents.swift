
/* Any, AnyObject, nil */
import Swift

/*
 Any - Swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드
 */

//MARK: - Any

var anyArr1 : [Any] = [1,2,"3","4"]
var anyArr2 : Array<Any> = [1,2,"3","4"]
var anyArr : [Any] = [1,"hi",true,1.0]


var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다."
someAny = 123.12


var vlaue: Any = "Sample String"
vlaue = 3
vlaue = false
vlaue = [1,3,4,7,9]
vlaue = {
    print("함수가 실행됩니다.")
}


func name(_ param: Any) {
    print("\(param)")
}

name(3) //Int
name(false) //Bool
name([1,3,4,7,9]) //Array
name {
    print(">>>>")
} // Function



var rows = [Any]()

rows.append(3)
rows.append(false)
rows.append([1,3,4,7,9])
rows.append {
    print(">>>>")
}

print(rows)


//let someDouble: Double = someAny

//MARK: - AnyObject

class SomeClass {}

var someAnyObject: AnyObject = SomeClass()

//someAnyObject = 123.12





//MARK: - nil

//someAny = nil
//someAnyObject = nil


class Exm {
    var name = "Sojin"
    
    func say(){
        print("Hello, " + name + "!")
    }
}

var obj:Exm = Exm();

obj.say();

obj.name = "Hanako";

obj.say();


struct Int : SignedInteger, Comparable, Equatable {

}

struct Double {
    
}

struct String {
    
}
