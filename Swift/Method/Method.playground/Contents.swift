import UIKit

struct Resolution {
    var width = 0
    var height = 0


// 구조체의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() ->  String {
        let desc = "이 해상도는 가로 \(self.width) X \(self.height)로 구성됩니다."
        return desc
    }
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?


    // 클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}

var res = Resolution()
res.width




