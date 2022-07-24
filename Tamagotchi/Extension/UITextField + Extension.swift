//
//  UITextField + Extension.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/24.
//

import UIKit

extension UITextField {
    
    func foodTextField(text: String) {
        
        self.placeholder = text
        self.textColor = .fontColor
        self.font = .systemFont(ofSize: 14)
        self.keyboardType = .numberPad
        self.textAlignment = .center
        self.backgroundColor = .backgroundColor
        self.borderStyle = .none
    }
    
    func renameTextField(text: String) {
        
        self.placeholder = text
        self.textColor = .fontColor
        self.font = .systemFont(ofSize: 14)
        self.borderStyle = .none
        
    }
}
