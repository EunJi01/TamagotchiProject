//
//  RenameViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/23.
//

import UIKit

class RenameViewController: UIViewController {
    static let identifier = "RenameViewController"
    
    @IBOutlet weak var renameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        renameTextField.text = UserDefaults.standard.string(forKey: "userName")
        view.backgroundColor = .backgroundColor
        
        navigationItem.title = "대장님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(save))
    }
    
    @objc func save() {
        if (renameTextField.text?.isEmpty)! {
            view.makeToast("글자를 입력해주세요!")
        } else {
            UserDefaults.standard.set("\(renameTextField.text!)", forKey: "userName")
            view.makeToast("이름 변경이 완료되었어요!")
            view.endEditing(true)
        }
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func renameTextFieldReturn(_ sender: UITextField) {
    }
}
