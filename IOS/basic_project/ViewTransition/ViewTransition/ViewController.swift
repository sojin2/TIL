//
//  ViewController.swift
//  ViewTransition
//
//  Created by 김소진 on 2020/07/20.
//  Copyright © 2020 sojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func touchUpSelectImageButton(_sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    //image picker가 한일을 우리에게 전달하기 위해서는 delegate가 필요하다.
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func touchUpSetButton(_sender: UIButton) {
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss" // 원하는방식으로 지정
        //formatter.dateStyle = .medium
        //formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_sender: UIDatePicker) {
        print("value change")
        
        let date: Date = self.datePicker.date //sender.date // sender = 메서드를 호출한 datePicker
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController의 view가 메모리에 로드 됨")
        
        
        self.datePicker.addTarget(self, action:#selector(self.didDatePickerValueChanged(_sender:)), for: UIControl.Event.valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ViewController의 view가 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("ViewController의 view가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("ViewController의 view가 화면에서 사라짐")
    }
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("ViewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("ViewController의 view가 subciew를 레이아웃 함")
    }

}

