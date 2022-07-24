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
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    @objc func save() {
        if (renameTextField.text?.count)! < 2 || (renameTextField.text?.count)! > 6 {
            view.makeToast("이름은 2~6글자로 입력해주세용!", position: .top)
        } else {
            UserDefaults.standard.set("\(renameTextField.text!)", forKey: "userName")
            //view.makeToast("이름 변경이 완료되었어요!")
            //view.endEditing(true)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func renameTextFieldReturn(_ sender: UITextField) {
    }
}
