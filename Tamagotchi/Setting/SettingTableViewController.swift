//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/23.
//

import UIKit

class SettingTableViewController: UITableViewController {

    static let identifier = "SettingTableViewController"
    
    enum SettingMenu: Int, CaseIterable {
        case rename
        case tamaChange
        case dataReset
        
        func menuTitle() -> String {
            switch self {
            case .rename: return "내 이름 설정하기"
            case .tamaChange: return "다마고치 변경하기"
            case .dataReset: return "데이터 초기화"
            }
        }
        
        func menuImageName() -> String {
            switch self {
            case .rename: return "pencil"
            case .tamaChange: return "moon.fill"
            case .dataReset: return "arrow.clockwise"
            }
        }
    }
    
    var userName: String = UserDefaults.standard.string(forKey: TamaEnum.UserDefualts.userName.rawValue) ?? "대장" {
        didSet {
            //tableView.reloadData() // reloadRows, reloadData 둘 다 동작 안됨
            self.tableView.reloadRows(at: [IndexPath(row: SettingMenu.rename.rawValue, section: 0)], with: .fade)
            print("didSet 실행됨") // 근데 이건 찍힌다
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "설정"
        self.navigationController?.navigationBar.topItem?.title = ""
        tableView.backgroundColor = .backgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingMenu.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = SettingMenu.allCases[indexPath.row].menuTitle()
        cell.accessoryType = .disclosureIndicator
        //cell.imageView?.image = UIImage(systemName: menuImageName[indexPath.row])
        cell.imageView?.image = UIImage(systemName: SettingMenu.allCases[indexPath.row].menuImageName())
        
        if indexPath.row == 0 {
            cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: TamaEnum.UserDefualts.userName.rawValue)
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
        
        let menu: SettingMenu = SettingMenu.allCases[indexPath.row]
        
        switch menu {
        case .rename:
            let sb = UIStoryboard(name: TamaEnum.StoryboardName.Setting.rawValue, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: RenameViewController.identifier)
            navigationController?.pushViewController(vc, animated: true)
        case .tamaChange:
            tamaChange()
        case .dataReset:
            resetAlert()
        }
    }
    
    func tamaChange() {
        let sb = UIStoryboard(name: TamaEnum.StoryboardName.Choice.rawValue, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else {
            return
        }
        
        UserDefaults.standard.set(true, forKey: TamaEnum.UserDefualts.change.rawValue)
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
        UserDefaults.standard.set(false, forKey: TamaEnum.UserDefualts.main.rawValue)
        noticeAlert()
    }
    
    func noticeAlert() {
        let alert = UIAlertController(title: "다마고치가 자연으로 돌아갔어요!", message: "초기 화면으로 이동합니다", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "웅!", style: .cancel, handler: { _ in self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)/*print("리셋 실행됨")*/ })
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
