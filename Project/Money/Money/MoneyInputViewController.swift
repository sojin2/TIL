//
//  MoneyInputViewController.swift
//  Mession
//
//  Created by 김소진 on 2021/10/18.
//

import UIKit

class MoneyInputViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var resultButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func textEditingChanged(_ sender: Any) {
        var text = textField.text ?? ""
        stepper.value = Double(text) ?? 0
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        var value = stepper.value
        textField.text = String(Int(value))
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var controller = segue.destination as? MoneyOutputViewController  {
            controller.numberOfTime = Int(stepper.value)
        }
    }


}
