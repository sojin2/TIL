/*컬렉션 타입*/
/*Array, Dictionary, Set*/

import Swift



/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 싸으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */

//MARK: - Array
var cities = ["Seoul", "New York", "LA", "Santiage"]

cities.append("Seoul") //["Seoul"]
cities.append("New York") //["Seoul", "New York"]
cities.insert("Tokyo", at: 1) //["Seoul", "Tokyo", "New York"]
cities.append(contentsOf: ["Dubai","Sydney"]) //["Seoul", "Tokyo", "New York", "Dubai", "Sydney"]


var rows : Array<Float> = [Float]()



var tables : [String] = Array()


var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2] // ["a", "b", "c"]
alphabet[2...3] // ["c", "d"]
alphabet[1..<3] // ["b", "c"]
alphabet[1...2] = ["1", "2", "3"]

print(alphabet)

// 정식 문법
let cities1: Array<String> = ["Seoul","New York"] // ["Seoul", "New York"]
 
// 단축 문법
let cities2: [String] = ["Tokyo", "Dubai"] // ["Tokyo", "Dubai"]
 
// 형식 추론
let cities3 = ["Sydney", "UK"] // ["Sydney", "UK"]
 
// 시퀀스
let num = Array(1...3) // [1, 2, 3]
 
// 여러 자료형(타입)
let anyArr: [Any] = [1, 2, "sojin", "소진"] // [1, 2, "sojin", "소진"]

// 단축 문법

var arr = [String]()

var list : [Int] = [] // 타입 어노테이션 + 초기화


var arr2 : Array<String> // 선언
arr2 = Array() // 초기화


// 단축 문법

var country : [String] // 선언
country = [] // 초기화


// 빈 Int Array 생상
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
//integers.append(101.1)

integers.contains(100)
integers.contains(99)

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

integers.count

//integers[0]

//Array<Double>와 [Double]는 동일한 표현
//빈 Double Array 생성
var doubles: Array<Double> = [Double]()

//빈 String Array 생성
var strings: [String] = [String]()

//빈 Character Array 생성
//[]는 새로운 빈 Array
var characters: [Character] = []

//let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1,2,3]

//immutableArray.append(4)
//immutableArray.removeAll()

//MARK: - Dictionary

//Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey")

anyDictionary["someKey"] = nil
anyDictionary
let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name":"sojin", "gender": "female"]



//MARK: - Set


var oddDigits : Set = [1, 3, 5, 7, 9] // 홀수 집합
let evecDigits : Set = [0, 2, 4, 6, 8] // 짝수 집합
let primeDigits : Set = [2, 3, 5, 7] // 소수 집합

oddDigits.intersection(evecDigits).sorted() // []
oddDigits.symmetricDifference(primeDigits).sorted() // [1,2,9]
oddDigits.union(evecDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.subtract(primeDigits) //{1, 9}
oddDigits.sorted() // [1, 9]


let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3,5]
let C : Set = [3,5]
let D : Set = [2, 4, 6]

B.isSubset(of: A) // true
A.isSuperset(of: B) // true
C.isStrictSubset(of: A) // true
C.isStrictSubset(of: B) // false
A.isDisjoint(with: D) // true


var  AA = [4 , 2, 5, 1, 7, 4, 9, 11, 3, 5, 4]

let BB = Set(AA) // 집합
AA = Array(BB) // 중복이 제거된 배열
// [2, 5, 11, 1, 7, 9, 3, 4]

//빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

integerSet
integerSet.contains(1)
integerSet.contains(2)

integerSet.remove(100)
integerSet.removeFirst()

integerSet.count

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

let union: Set<Int> = setA.union(setB) //합집합

let sortedUnion: [Int] = union.sorted()//정렬

let intersection: Set<Int> = setA.intersection(setB)//교집합

let subtracting: Set<Int> = setA.subtracting(setB)//차집합

integerSet.insert(99)
