//
//  UILabel + Extension.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/24.
//

import UIKit

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
