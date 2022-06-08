import UIKit
import Darwin


// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async {
    // UI update
    let view = UIView()
    view.backgroundColor = .blue
}

// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 진짜 핵중요, 지금 당장해야 하는 것
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것, 사용자가 결과를 기다린다
}

DispatchQueue.global(qos: .default).async {
    // 이건 굳이?
}

DispatchQueue.global() // default와 같은 것임 그래서 default를 잘 사용안 함

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는 것, 네트워킹, 큰 파일 불러올때?
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는것들, 뉴스데이터 미리 받기, 위치 자동 업데이트, 영상 다운 등등
}

// - Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrnet", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serialQueue", qos: .background)

// 복함적인 상황

func downloadImageFromServer() -> UIImage {
    // Heavy Task
    return UIImage()
}

func updateUI(image: UIImage) {
    
}

DispatchQueue.global(qos: .background).async {
    // download
    let image = downloadImageFromServer()

    DispatchQueue.main.async {
        // update ui
        updateUI(image: image)
    }
    
}
/// UI update를 하는 경우는 항상 main thread에서 해야함 그래서 내부에 중복으로 사용해주는 습관 가지기


// Sync, Async

// Async
// 대부분 사용
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("🙂 \(i)")
    }
}

// Sync
// 뒤에 것을 블락하고 처음 것을 먼저 처리
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).sync {
    for i in 0...5 {
        print("🙂 \(i)")
    }
}
