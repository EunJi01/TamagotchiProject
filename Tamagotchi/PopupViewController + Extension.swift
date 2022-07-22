//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit

extension UIButton {
    
    func designButton(lebelText: String) {
        self.titleLabel?.text = "\(lebelText)"
        self.titleLabel?.textColor = .fontColor
        self.layer.borderColor = UIColor.fontColor.cgColor
        self.layer.borderWidth = 1
    }
    
}

extension UILabel {
    
    func designLable() {
        self.textColor = .fontColor
        self.font = .boldSystemFont(ofSize: 14)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.fontColor.cgColor
        self.textAlignment = .center
        self.layer.cornerRadius = 5
        self.backgroundColor = .backgroundColor
    }
}

extension UIView {
    
    func setPopupView() {
        
    }
    
}
