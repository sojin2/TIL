import UIKit
import RxSwift
import Foundation

let observable = Observable.of(1, 2, 3, 4)
observable.subscribe()

observable.subscribe { element in
    print("Observable로부터 \(element)를 전달받았습니다.")
} onError: { error in
    print(error.localizedDescription)
} onCompleted: {
    print("Observable이 정상적으로 종료되었습니다.")
} onDisposed: {
    print("Observable이 버려졌습니다.")
}

// 메모리 누수
/*
observable.subscribe(onNext: { [weak self] _ in
    self?.someFunc()
})

observable.subscribe(with: self) { strongSelf, _ in
    strongSelf.someFunc()
}
*/

// just - 하나의 요소만 방출
let justStringObservable = Observable.just("hello world")
let justIntObservable = Observable.just(100)

justStringObservable.subscribe (onNext: { element in
    print(element)
}, onCompleted: {
    print("completed")
})


justIntObservable.subscribe (onNext: { element in
    print(element)
}, onCompleted: {
    print("completed")
})

let justObervable: Observable<String> = Observable.just("Hello World")

// of - 여러개의 요소들을 순차적으로 방출
let ofObservable = Observable.of("hi", "my", "name", "is", "sojin")

ofObservable.subscribe { element in
    print(element)
} onCompleted: {
    print("completed")
}

/* 주의 사항
 of()안에 들어가는 요소들은 타입추론되어서 타입 제한이 생기기때문에 하나의 타입으로 통일 시켜줘야합니다.


// Error
let ofObservable = Observable.of("hi", "i'm", 3, "years", "old", "sojin")

// Ok
let ofObservable: Observable<Any> = Observable.of("hi", "i'm", 3, "years", "old", "sojin")

*/


// from - 배열로 요소를 받은 후에 하나하나 요소로서 방출해주는 연산자
let fromObservable = Observable.from(["sojin", "is", "green"])

fromObservable.subscribe{ element in
    print(element)
} onCompleted: {
    print("completed")
}
