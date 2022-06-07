import UIKit

let arr = [1,3,4,5,6]
var imperative = [Int]()

// 명령형
for num in arr {
    imperative.append(num * 2)
}

// 선언형
let declarative = arr.map {$0 * 2}



print(imperative)
print(declarative)


