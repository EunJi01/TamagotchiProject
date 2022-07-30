//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/23.
//

import UIKit
import Toast

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
    var tamaExp = TamaExp()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.string(forKey: "userName") == nil {
            UserDefaults.standard.set("대장", forKey: "userName")
        }
        
        view.backgroundColor = .backgroundColor
        designContents()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        self.navigationController?.navigationBar.tintColor = .fontColor
        levelData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tamagotchiNameLabel.designNameLabel(name: UserDefaults.standard.string(forKey: "tamaName") ?? "오류")
        guard let userName = UserDefaults.standard.string(forKey: "userName") else { return }
        navigationItem.title = "\(userName)님의 다마고치"
        levelData()
    }
    
    @objc func settingButtonTapped() {
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as? SettingTableViewController else {
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        let count = Int(riceTextField.text!)
        
        if !(count == nil) {
            if count! > 99 {
                view.makeToast("한번에 먹을 수 없는 양이에요ㅠㅠ", position: .top)
            } else {
                tamaExp.rice += count!
                view.makeToast(tamaExp.expPercentStr(), position: .top)
            }
        } else {
            tamaExp.rice += 1
            view.makeToast(tamaExp.expPercentStr(), position: .top)
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
                view.makeToast("한번에 먹을 수 없는 양이에요ㅠㅠ", position: .top)
            } else {
                tamaExp.water += count!
                view.makeToast(tamaExp.expPercentStr(), position: .top)
            }
        } else {
            tamaExp.water += 1
            view.makeToast(tamaExp.expPercentStr(), position: .top)
        }
        
        print(tamaExp.calculate())
        UserDefaults.standard.set(tamaExp.water, forKey: "water")
        levelData()
        waterTextField.text = nil
    }
    
    func designContents() {
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleImageView.contentMode = .scaleToFill

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
        guard let number = UserDefaults.standard.string(forKey: "tamaNumber") else { return }
        
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
