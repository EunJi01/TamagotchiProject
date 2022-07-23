//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/23.
//

import UIKit
import Toast
import TextFieldEffects

class MainViewController: UIViewController {
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    @IBOutlet weak var tamagotchiLevelLabel: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    static let identifier = "MainViewController"
    var tamaData: Tama?
    var tamaExp = TamaExp()
    var level = UserDefaults.standard.integer(forKey: "level")
    var name = UserDefaults.standard.string(forKey: "userName")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(tamaData?.kind, forKey: "tamaName")
        UserDefaults.standard.set(tamaData?.number, forKey: "tamaNumber")
        
        view.backgroundColor = .backgroundColor
        designNavigationBar()
        designContents()
        levelData()

    }
    
    @objc func settingButtonTapped() {
        // 설정
    }
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        let count = Int(riceTextField.text!)
        
        if !(count == nil) {
            if count! > 99 {
                view.makeToast("한번에 먹을 수 없는 양이에요ㅠㅠ")
            } else {
                tamaExp.rice += count!
            }
        } else {
            tamaExp.rice += 1
        }
        
        UserDefaults.standard.set(tamaExp.rice, forKey: "rice")
        levelData()
        riceTextField.text = nil
    }
    
    // 나중에 스위치와 매개변수를 활용해서 코드 리펙토링 하기
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        let count = Int(waterTextField.text!)
        
        if !(count == nil) {
            if count! > 49 {
                view.makeToast("한번에 먹을 수 없는 양이에요ㅠㅠ")
            } else {
                tamaExp.water += count!
            }
        } else {
            tamaExp.water += 1
        }
        
        UserDefaults.standard.set(tamaExp.water, forKey: "water")
        levelData()
        waterTextField.text = nil
    }
    
    func designNavigationBar() {
        navigationItem.title = "\(name)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        // 컬러 체인지
    }
    
    func designContents() {
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleImageView.contentMode = .scaleToFill
        
        tamagotchiNameLabel.designNameLabel(name: tamaData?.kind ?? "오류")
        messageLabel.numberOfLines = 0
        
        riceButton.designButton(lebelText: "밥먹기")
        waterButton.designButton(lebelText: "물먹기")
        riceButton.layer.cornerRadius = 5
        waterButton.layer.cornerRadius = 5
        riceButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        waterButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        
        riceTextField.foodTextField(text: "밥주세용")
        waterTextField.foodTextField(text: "물주세용")
    }
    
    func levelData() {
        let level = tamaExp.calculate()
        let rice = UserDefaults.standard.integer(forKey: "rice")
        let water = UserDefaults.standard.integer(forKey: "water")
        guard let number = tamaData?.number else { return }
        
        tamagotchiLevelLabel.disignNormalLabel(text: "LV\(level), 밥알\(rice)개, 물방울\(water)개")
        print("\(number)-\(level)")
        messageLabel.disignNormalLabel(text: TamaInfo().tamaText.randomElement() ?? "오류")

        tamagotchiImageView.image = UIImage(named: "\(number)-\(level)") ?? UIImage(systemName: "xmark.app")!

    }
    
    func loadTamaData() {
        UserDefaults.standard.string(forKey: "tamaName")
        
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func riceTextFieldReturn(_ sender: UITextField) {
    }
    @IBAction func waterTextFieldReturn(_ sender: UITextField) {
    }
    
}
