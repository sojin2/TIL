import UIKit
import RxSwift

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


