//
//  ViewController.swift
//  CustomTableView
//
//  Created by 김소진 on 11/30/23.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController  {
    
    private let 회원탈퇴 = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 9
    }
    
    private let 로고이미지 = UIImageView().then {
        $0.layer.cornerRadius = 49
        $0.image = UIImage(named: "circle")
        $0.contentMode = .scaleToFill
    }
    
    private let 제목 = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .center
        $0.text = "어디GO 탈퇴 전에 확인해 주세요"
    }

    private let 설명1 = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 14)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "탈퇴하시면 소속된 회사의 현장에서 제외되며,\n 어디GO 접속 및 계정 복구가 불가능합니다."
    }
    
    private let 설명2 = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 14)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "또한, 유의사항 내에서는 포함되는 정보를 제외한\n 모든 개인정보는 삭제됩니다."
    }
    
    private let 유의사항 = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 9
    }

    private let 유의사항제목 = UILabel().then {
        $0.font = UIFont.fontWithName(type: .bold, size: 16)
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.text = "유의사항"
    }
    
    private let 유의사항설명 = UITextView().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 14)
        $0.backgroundColor = .purple
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.isEditable = false
        $0.text =
        """
        - 근로를 제공한 회사가 ‘어디GO’에 존재하는 경우, 회사에 귀속된 데이터(출퇴근 기록 외)에 대해서는 보관됩니다.
        
        - 전자상거래법 등에서의 소비자 보호에 관한 법률
            - 표시, 광고에 관한 기록 : 6개월
            - 계약 또는 청약 철회 등에 관한 기록 : 5년
            - 대금 결제 및 재화 등의 공급에 관한 기록 : 5년
            - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
        """
    }
    
    private let 동의 = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 9
    }

    private let 동의합니다 = UILabel().then {
        $0.font = UIFont.fontWithName(type: .regular, size: 14)
        $0.tintColor = .black
        $0.textAlignment = .center
        $0.text = "위 내용을 모두 확인 했으며, 이에 동의합니다."
    }
    
    
    let 동의버튼 = UIButton().then {
        $0.setImage(UIImage(named: "circle"), for: .normal)
        
    }
    
    let 탈퇴버튼 = UIButton().then {
        $0.setTitle("탈퇴하기", for: .normal)
        $0.layer.cornerRadius = 9
        $0.backgroundColor = .black
        $0.tintColor = .white
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
//        qrBtn.addTarget(self, action: #selector(self.onQrCode), for: .touchUpInside)

    }
    
    func setup() {
        view.backgroundColor = .gray
        addViews()
        
    }
    
    @objc func onQrCode() {
        print("클릭댐")
    }
    
    // 아래에 있을수록 view 제일 위에 뜸
    func addViews() {
        view.addSubview(회원탈퇴)
        회원탈퇴.addSubview(로고이미지)
        회원탈퇴.addSubview(제목)
        회원탈퇴.addSubview(설명1)
        회원탈퇴.addSubview(설명2)
        
        view.addSubview(유의사항)
        유의사항.addSubview(유의사항제목)
        유의사항.addSubview(유의사항설명)
        
        view.addSubview(동의)
        동의.addSubview(동의버튼)
        동의.addSubview(동의합니다)
        
        view.addSubview(탈퇴버튼)
        setConstraint()
    }
    
    private func setConstraint() {
        
        회원탈퇴.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.bottom.equalTo(유의사항.snp.top).offset(-10)
            $0.height.equalTo(240)
        }
        
        로고이미지.snp.makeConstraints{
            $0.top.equalTo(회원탈퇴.snp.top).inset(20)
            $0.bottom.equalTo(제목.snp.top).offset(-20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        제목.snp.makeConstraints{
            $0.top.equalTo(로고이미지.snp.bottom).offset(-20)
            $0.bottom.equalTo(설명1.snp.top).offset(-12)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        설명1.snp.makeConstraints{
            $0.top.equalTo(제목.snp.bottom).offset(-12)
            $0.bottom.equalTo(설명2.snp.top).offset(-10)
            $0.centerX.equalToSuperview()
        }
        
        설명2.snp.makeConstraints{
            $0.top.equalTo(설명1.snp.bottom).offset(-10)
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }

        
        
        유의사항.snp.makeConstraints{
            $0.top.equalTo(회원탈퇴.snp.bottom).offset(-10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(220)
        }
        
        유의사항제목.snp.makeConstraints{
            $0.top.equalTo(유의사항.snp.top).offset(20)
            $0.bottom.equalTo(유의사항설명.snp.top).offset(-12)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        
        유의사항설명.snp.makeConstraints{
            $0.top.equalTo(유의사항제목.snp.bottom).offset(-12)
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
   
        동의.snp.makeConstraints{
            $0.top.equalTo(유의사항.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(61)
        }
        
        동의버튼.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalTo(동의합니다.snp.leading).offset(10)
        }
        
        동의합니다.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(동의버튼.snp.leading).inset(10)
            $0.trailing.equalToSuperview()
        }
        
        
        탈퇴버튼.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(60)
            $0.top.greaterThanOrEqualTo(동의.snp.bottom).offset(20)
            $0.bottom.lessThanOrEqualToSuperview().inset(50)
        }

    }
    
}



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    private var cellForRowAtAction: ((IndexPath) -> UITableViewCell)?
//    private var didSelectAction: ((Int) -> Void)?
//    
//    var aa = [EquipCell.self, StaffCell.self, EquipCell.self]
//
////    private let tableView: UITableView = {
////        tableView.register(EquipCell.self, forCellReuseIdentifier: "EquipCell")
////        return tableView
////    }()
//    
////    private let tableView: UITableView = {
////        tableView.register(StaffCell.self, forCellReuseIdentifier: "StaffCell")
////        return tableView
////    }()
//    
//    private let tableView = UITableView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        
//        for a in aa {
//            print("a", a)
//            tableView.register(a, forCellReuseIdentifier: "\(a)")
//        }
//        
//        
//        configure()
//        addViews()
//        setConstraint()
//        
//    }
//    
//    func setAction(cellForRowAt: @escaping ((IndexPath) -> UITableViewCell), didSelect: @escaping (Int) -> Void) {
//        self.cellForRowAtAction = cellForRowAt
//        self.didSelectAction = didSelect
//    }
//    
//    
//    
//    func configure() {
//        tableView.backgroundColor = .white
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = 70
//    }
//    
//    
//    func addViews() {
//        view.addSubview(tableView)
//    }
//    
//    private func setConstraint() {
//        
//        tableView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
//        
//    }

//}

//extension ViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
////        let cell = tableView.dequeueReusableCell(withIdentifier: EquipCell.identifier, for: indexPath) as! EquipCell
//        
////        let cell = tableView.dequeueReusableCell(withIdentifier: StaffCell.identifier, for: indexPath) as! StaffCell
//        // var cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
//
//        return self.cellForRowAtAction!(indexPath)
//    }
//}


