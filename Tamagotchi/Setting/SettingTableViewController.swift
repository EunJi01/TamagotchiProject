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
        self.navigationController?.navigationBar.topItem?.title = ""
        tableView.backgroundColor = .backgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        print(UserDefaults.standard.bool(forKey: "pop"))
//        if UserDefaults.standard.bool(forKey: "pop") == true {
//            navigationController?.popViewController(animated: true)
//            UserDefaults.standard.set(false, forKey: "pop")
//            print("테이블뷰 pop 실행됨")
//        }
        
        tableView.reloadData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") else {
            return UITableViewCell()
        }
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           52
       }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let sb = UIStoryboard(name: "Setting", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: RenameViewController.identifier)
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            tamaChange()
        case 2:
            resetAlert()
        default:
            view.makeToast("오류가 발생했어요ㅠㅠ")
        }
    }
    
    func tamaChange() {
        let sb = UIStoryboard(name: "Choice", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else {
            return
        }
        
        UserDefaults.standard.set(true, forKey: "change")
        navigationController?.pushViewController(vc, animated: true)
        
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
        UserDefaults.standard.set(false, forKey: "Main")
        noticeAlert()
    }
    
    // 어플을 시뮬레이터에서 종료했다가 다시 켜서 초기화하면 rootView로 안돌아가짐 --> 특정 조건에서 핸들러가 작동을 안함
    func noticeAlert() {
        let alert = UIAlertController(title: "다마고치가 자연으로 돌아갔어요!", message: "초기 화면으로 이동합니다", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "웅!", style: .cancel, handler: { _ in /*self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)*/print("리셋 실행됨") })
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
