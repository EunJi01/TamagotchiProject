//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit
import TextFieldEffects

extension UIButton {
    func designButton(lebelText: String) {
        self.setTitle("\(lebelText)", for: .normal)
        self.tintColor = .fontColor
        self.layer.borderColor = UIColor.fontColor.cgColor
        self.layer.borderWidth = 1
        self.titleLabel?.font = .boldSystemFont(ofSize: 14)
    }
}
