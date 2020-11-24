/* 반복문 */

import Swift

var integers = [1,2,3] //array
let people = ["sojin": 23, "eric":20, "mike":22] //dictionary

//MARK: - for-in

//for <#item#> in <#items#> {
//    <#code#>
//}

for integer in integers {
    print(integer)
}

//Dictionary의 item은 key와 value로 구성된 튜플 타입입니다.
for (name, age) in people {
    print("\(name): \(age)")
}

//MARK: - while

//while <#condition#> {
//    <#code#>
//}

while integers.count > 1 {
    integers.removeLast()
}

//MARK: - repeat-while

//repeat {
//    code
//} while <#condition#>

repeat {
    integers.removeLast()
} while integers.count > 0
