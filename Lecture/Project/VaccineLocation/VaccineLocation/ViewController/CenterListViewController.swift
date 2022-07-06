//
//  CenterListViewController.swift
//  VaccineLocation
//
//  Created by HelloDigital_iOS_Dev on 2022/06/23.
//

import UIKit
import Moya
import RxSwift

class CenterListViewController: UITableViewController {
    
    @IBOutlet var centerTableView: UITableView!
    
    
    let viewModel = VaccineViewModel()
    var centerListSaveObs = AsyncSubject<[CenterVO.CenterDetailVO]>()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        let nibName = UINib(nibName: "LocationListCell", bundle: nil)
        centerTableView.register(nibName, forCellReuseIdentifier: "LocationListCell")

    }
}


extension CenterListViewController {
    
    func setupUI() {
        viewModel.requestPointSaveList(page: 0, { [weak self] list in
            self?.centerListSaveObs.onNext(list)
            self?.centerListSaveObs.onCompleted()
        })
    }
    
    func setupRx(){
        viewModel.centerListObs.subscribe(onNext:{ list in
            print("No data")
        }).disposed(by: disposeBag)
    }
    
    func bindTableView() {
        
        viewModel.centerListObs.bind(to: tableView.rx) { element in
            
            if element.isReplied {
                let cell = centerTableView.dequeueReusableCell(withIdentifier: LocationListCell.stringName) as? LocationListCell
                cell?.setData(element)
                return cell!
            }
            
        }.disposed(by: disposeBag)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return centerList.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationListCell", for: indexPath) as? LocationListCell else { return UITableViewCell() }
//
//        cell.centerLabel.text = "\(centerList[indexPath.row].centerName)"
//        cell.buildingLabel.text = "\(centerList[indexPath.row].facilityName)"
//        cell.addressLabel.text = "\(centerList[indexPath.row].address)"
//        cell.DateLabel.text = "\(centerList[indexPath.row].createdAt)"
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //상세화면 전달
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let detailViewController = storyboard.instantiateViewController(identifier: "CenterDeatilViewController") as? CenterDeatilViewController else { return }
//
////        detailViewController.centerDetail = centerList[indexPath.row]
//        self.show(detailViewController, sender: nil)
//
//    }
}
