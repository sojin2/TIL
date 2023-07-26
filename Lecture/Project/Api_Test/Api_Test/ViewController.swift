//
//  ViewController.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/03.
//

import UIKit
import Alamofire
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    var res: [UsersResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let disposeBag = DisposeBag()

        func spotDetail1() -> Observable<SpotDetailResult> {
            return Observable.create { observer -> Disposable in
                let url = Https.API_HOST + "/api/v2/users/sites/22"
                AF.request(APIManager.shared.request(.GET, url, authorize: true))
                    .responseDecodable(of: SpotDetailResult.self)  { response in
                        switch response.result {
                        case .success(let data):
                            print("성공임 ㅎㅅㅎ")
                            print("1111111122222333344444@@@@@@@OK",data)

                                // res = data.result

                            //print("~~!!@@##",data.result?.checkInAttendance?.checkIn)
                            //print("~~!!@@##",res.checkInAttendance?[0].checkIn)

                        case .failure(let error):
                            print("실패임 ㅜ.ㅜ")
                            print("1111111122222333344444@@@@@@@ERROR",error)
                        }
                    }
                return Disposables.create()
            }
        }
        
        func spotDetail() -> Observable<SpotDetailResult> {
            return Observable.create { observer -> Disposable in
                AF.request(APIBase.getUserSpoㄷtDetail)
                    .responseDecodable(of: SpotDetailResult.self)  { response in
                        switch response.result {
                        case .success(let data):
                            print("성공임 ㅎㅅㅎ")
                            print("OK",data)

                                // res = data.result

                            //print("~~!!@@##",data.result?.checkInAttendance?.checkIn)
                            //print("~~!!@@##",res.checkInAttendance?[0].checkIn)

                        case .failure(let error):
                            print("실패임 ㅜ.ㅜ")
                            print("ERROR",error)
                        }
                    }
                return Disposables.create()
            }
        }
    
        
        
        
        spotDetail()
            .subscribe(onNext: {
                print("~~!!",$0)
            })
            .disposed(by: disposeBag)
        
        
//        func PhoneUser() -> Observable<PhoneVO> {
//            return Observable.create { observer -> Disposable in
//                AF.request(APIBase.getAccountPhone)
//                    .responseDecodable(of: PhoneVO.self)  { response in
//                        switch response.result {
//                        case .success(let data):
//                            print("성공임 ㅎㅅㅎ")
//                            print("OK",data)
//                        case .failure(let error):
//                            print("실패임 ㅜ.ㅜ")
//                            print("ERROR",error)
//                        }
//                    }
//                return Disposables.create()
//            }
//        }
        
        PhoneUser()
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        func User() -> Observable<UserVO> {
            return Observable.create { observer -> Disposable in
                AF.request(APIBase.getUserInfo)
                    .responseDecodable(of: UserVO.self)  { response in
                        switch response.result {
                        case .success(let data):
                            print("성공임 ㅎㅅㅎ")
                            print("OK",data)
                        case .failure(let error):
                            print("실패임 ㅜ.ㅜ")
                            print("ERROR",error)
                        }
                    }
                return Disposables.create()
            }
        }
        
        User()
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)

        
        func Company() -> Observable<CompanyVO> {
            return Observable.create { observer -> Disposable in
                AF.request(APIBase.getUserCompany)
                    .responseDecodable(of: CompanyVO.self)  { response in
                        switch response.result {
                        case .success(let data):
                            print("성공임 ㅎㅅㅎ")
                            print("OK",data)
                        case .failure(let error):
                            print("실패임 ㅜ.ㅜ")
                            print("ERROR",error)
                        }
                    }
                return Disposables.create()
            }
        }
        
        Company()
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        
        func Spot() -> Observable<SpotVO> {
            return Observable.create { observer -> Disposable in
                AF.request(APIBase.getUserSpot)
                    .responseDecodable(of: SpotVO.self)  { response in
                        switch response.result {
                        case .success(let data):
                            print("성공임 ㅎㅅㅎ")
                            print("OK",data)
                        case .failure(let error):
                            print("실패임 ㅜ.ㅜ")
                            print("ERROR",error)
                        }
                    }
                return Disposables.create()
            }
        }
        
        Spot()
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        func SpotUser() -> Observable<UsersVO> {
            return Observable.create { observer -> Disposable in
                AF.request(APIBase.getSpotUser)
                    .responseDecodable(of: UsersVO.self)  { [self] response in
                        switch response.result {
                        case .success(let data):
                            print("성공임 ㅎㅅㅎ")
                            print("OK",data)
                            
                            res = data.result
                            print("~~!!@@##", res?.count)
                            for i in 0..<res!.count {
                                print("~~!!@@##",res?[i].companyUser?.name)
                            }
                        case .failure(let error):
                            print("실패임 ㅜ.ㅜ")
                            print("ERROR",error)
                        }
                    }
                return Disposables.create()
            }
        }
        
        SpotUser()
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
    }
    
}

