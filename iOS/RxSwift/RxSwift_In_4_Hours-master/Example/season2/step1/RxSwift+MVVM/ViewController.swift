//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class 나중에생기는데이터<T> { //Observable
    private let task: (@escaping (T) -> Void) -> Void
    
    init(task: @escaping (@escaping (T) -> Void) -> Void) {
        self.task = task
    }
    
    func 나중에오면(_ f: @escaping (T) -> Void) { // subscribe
        task(f)
    }
}


class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }

    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }
    
    // @escaping 처리 : 본체함수가 끝나고 나서 실행되는 부분이라 @escaping 으로 표시해주어야함
//    func downloadJson(_ url: String, _ completion: @escaping (String?) -> Void) {
//        DispatchQueue.global().async {
//            let url = URL(string: url)!
//            let data = try! Data(contentsOf: url)
//            let json = String(data: data, encoding: .utf8)
//            DispatchQueue.main.async {
//                completion(json)
//            }
//        }
//    }
    
    // 옵셔널 처리
//    func downloadJson(_ url: String, _ completion: ((String?) -> Void)?) {
//        DispatchQueue.global().async {
//            let url = URL(string: url)!
//            let data = try! Data(contentsOf: url)
//            let json = String(data: data, encoding: .utf8)
//
//            DispatchQueue.main.async {
//                completion?(json)
//            }
//        }
//    }
    
    // Observable의 생명주기
    // 1. Create
    // 2. Subscribe : 이때부터 실행
    // 3. onNext
    // ---- 끝 ----
    // 4. onCompleted   /  onError
    // 5. Disposed
    
    
    // Rxswift
    func downloadJson(_ url: String) -> Observable<String?> {
        
        // 데이터 하나만 보내는 방법
        // return Observable.just("Hello World")
        
        // Just로 한번에 데이터 두개 보내는 방법
        //return Observable.just(["Hello", "World"])
        
        // 배열 값을 하나씩 내리고 싶을때 사용
        return Observable.from(["Hello", "World"])
        
        // 1. 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
//        return Observable.create() { emitter in
//            let url = URL(string: url)!
//            let task = URLSession.shared.dataTask(with: url) { (data, _, err) in
//                guard err == nil else {
//                    emitter.onError(err!)
//                    return
//                }
//
//                if let dat = data, let json = String(data: dat, encoding: .utf8) {
//                    emitter.onNext(json)
//                }
//
//                emitter.onCompleted()
//            }
//
//            task.resume()
//
//            return Disposables.create() {
//                task.cancel()
//            }
//
//        }
        
//        return Observable.create() { emitter in
//            emitter.onNext("Hello")
//            emitter.onNext("World")
//            emitter.onCompleted()
//
//            return Disposables.create()
//        }
        
        
//        return Observable.create { f in
//            DispatchQueue.global().async {
//                let url = URL(string: url)!
//                let data = try! Data(contentsOf: url)
//                let json = String(data: data, encoding: .utf8)
//
//                DispatchQueue.main.async {
//                    f.onNext(json)
//                    f.onCompleted() // 순환 참조 문제 해결
//                }
//            }
//
//            return Disposables.create()
//        }
    }

    

    // MARK: SYNC

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBAction func onLoad() {
        editView.text = ""
        self.setVisibleWithAnimation(self.activityIndicator, true)

        // 옵셔널/ @escaping 처리
//        downloadJson(MEMBER_LIST_URL) { json in
//            self.editView.text = json
//            self.setVisibleWithAnimation(self.activityIndicator, false)
//        }
        
//        let json:나중에생기는데이터<String?> = downloadJson(MEMBER_LIST_URL)
//
//        json.나중에오면 { json in
//            self.editView.text = json
//            self.setVisibleWithAnimation(self.activityIndicator, false)
//        }
        
        // 2. Observable로 오는 데이터를 받아서 처리하는 방법
        
        let _ = downloadJson(MEMBER_LIST_URL)
            .map { json in json?.count ?? 0 } // operator - 데이터를 json.count로 변경
            .filter { cnt in cnt > 0 } // operator - cnt가 0보다 큰 경우만
            .map { "\($0)" } // operator - 값 String으로 변경
            .observeOn(MainScheduler.instance) // suger : operator(데이터를 중간에 바꾸는 sugar) --> DispatchQueue.global().async 쓰기 너무 번거로울때 / 다음줄에 영향을 줌
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default )) // 첫째 줄에 영향을 줌
            .subscribe(onNext: { json in
                // onNext만 사용하고 싶을때
                // (onNext: { print ($0) })
                
                // onNext, onCompleted 사용
                // (onNext: { print ($0), onCompleted: { print("Com")})
                
                // onNext, onCompleted, onError 사용
                // (onNext: { print ($0), onCompleted: { print("Com")}, onError: {err in print(err)})
                self.editView.text = json
                self.setVisibleWithAnimation(self.activityIndicator, false)
            })
        
        
        
        
        /*
         let obserable = downloadJson(MEMBER_LIST_URL)
         
        let disposable = obserable.subscribe { event in
            switch event {
            case .next(let t):
                print(t)
                break
                
            case .error:
                break
                
            case .completed:
                break
            }
            
            // 종료
            //disposable.dispose()
        }
        */
        
        
//        downloadJson(MEMBER_LIST_URL)
//            .debug() // 다 찍힘
//            .subscribe { event in
//                switch event {
//                case let .next(json):
//                    DispatchQueue.main.async {
//                        self.editView.text = json
//                        self.setVisibleWithAnimation(self.activityIndicator, false)
//                    }
//                case .completed:
//                    break
//                case .error:
//                    break
//                }
//
//            }
        
        

    }
}
