//
//  ViewController.swift
//  CornerRadius
//
//  Created by 김소진 on 2023/09/05.
//

import SnapKit
import Then

class ViewController: UIViewController {
    
    private let cornerView = UIView().then {
        $0.backgroundColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        view.backgroundColor = .white
        view.addSubview(cornerView)
        cornerView.roundCorners(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        cornerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 300, left: 100, bottom: 300, right: 100))
        }
    }

}

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
