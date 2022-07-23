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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = menu[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        if indexPath.row == 0 {
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0: print("이름 변경 화면")
        case 1: print("다마고치 변경 화면")
        case 2: print("데이터 초기화 화면")
        default: print("존재하지 않는 셀")
            
        }
    }
}
