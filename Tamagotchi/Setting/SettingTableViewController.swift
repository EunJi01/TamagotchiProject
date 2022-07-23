//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/23.
//

import UIKit

class SettingTableViewController: UITableViewController {

    static let identifier = "SettingTableViewController"
    let menu = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    let menuImageName = ["pencil", "moon.fill", "arrow.clockwise"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "설정"
        tableView.backgroundColor = .backgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = menu[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(systemName: menuImageName[indexPath.row])
        
        if indexPath.row == 0 {
            cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "userName")
        } else {
            cell.detailTextLabel?.text = nil
        }

        cell.textLabel?.font = .boldSystemFont(ofSize: 14)
        cell.backgroundColor = .backgroundColor
        cell.tintColor = .fontColor
        // 셀 높이
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let sb = UIStoryboard(name: "Setting", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: RenameViewController.identifier)
            navigationController?.pushViewController(vc, animated: true)
        case 1: print("다마고치 변경하기")
        case 2:
            resetAlert()
        default: print("존재하지 않는 셀")
            
        }
    }
    
    func tamaChange() {
        // 초이스로 푸쉬(초이스 네비바 타이틀 변경) -> 팝업뷰 -> 루트뷰 디스미스
    }
    
    func resetAlert() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 처음부터 다시 시작하실 건가용?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아냐!", style: .cancel, handler: nil)
        let reset = UIAlertAction(title: "웅", style: .default, handler: { _ in self.resetData() })
        alert.addAction(cancel)
        alert.addAction(reset)
        
        present(alert, animated: true, completion: nil)
    }
    
    func resetData() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
