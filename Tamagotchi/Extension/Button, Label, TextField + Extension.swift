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

extension UILabel {
    
    func disignNormalLabel(text: String) {
        self.textColor = .fontColor
        self.font = .boldSystemFont(ofSize: 14)
        self.textAlignment = .center
        self.text = text
    }
    
    func designNameLabel(name: String) {
        self.textColor = .fontColor
        self.font = .boldSystemFont(ofSize: 14)
        self.textAlignment = .center
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.fontColor.cgColor
        self.layer.cornerRadius = 5
        self.backgroundColor = .backgroundColor
        self.text = name
    }

}

extension UITextField {
    
    func foodTextField(text: String) {
        
        self.placeholder = text
        self.textColor = .fontColor
        self.font = .systemFont(ofSize: 14)
        self.keyboardType = .numberPad
        self.textAlignment = .center
        
    }
    
    func renameTextField(text: String) {
        
        self.placeholder = text
        self.textColor = .fontColor
        self.font = .systemFont(ofSize: 14)
        
    }
}
