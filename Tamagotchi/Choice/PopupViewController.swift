//
//  PopupViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit

class PopupViewController: UIViewController {
    
    static let identifier = "PopupViewController"
    var tamaData: Tama?
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupImageView: UIImageView!
    @IBOutlet weak var popupTamagotchiNameLabel: UILabel!
    @IBOutlet weak var popupDetailLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.designButton(lebelText: "취소")
        startButton.designButton(lebelText: "시작하기")
        
        popupTamagotchiNameLabel.designNameLabel(name: tamaData?.kind ?? "오류")
        popupDetailLabel.disignNormalLabel(text: tamaData?.detail ?? "오류")
        popupDetailLabel.font = .systemFont(ofSize: 14)
        
        popupView.layer.cornerRadius = 10
        //        popupView.layer.borderColor = UIColor.fontColor.cgColor
        //        popupView.layer.borderWidth = 1
        popupView.layer.backgroundColor = UIColor.backgroundColor.cgColor
        view.backgroundColor = UIColor(named: "ViewBackgroundColor")
        // 뷰가 투명하게 안됨ㅠㅠ
        
        popupImageView.image = tamaData?.image
        
    }
    
    //    override func viewDidDisappear(_ animated: Bool) {
    //
    //        print(#function)
    //
    //        if UserDefaults.standard.bool(forKey: "pop") == true {
    //            print("팝 실행됨")
    //            navigationController?.popViewController(animated: true)
    //        }
    //
    //    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        if UserDefaults.standard.bool(forKey: TamaEnum.UserDefualts.change.rawValue) == false {
            
            let sb = UIStoryboard(name: TamaEnum.StoryboardName.Main.rawValue, bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else {
                return
            }
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            UserDefaults.standard.set(true, forKey: TamaEnum.UserDefualts.main.rawValue)
            
            present(nav, animated: true)
        } else {
            
            // 다마고치 변경을 선택하면 자동으로 rootView(Main)까지 pop되게 하고 싶었는데 너무 어려워요...
            // 1(선택화면) -> 2(팝업) -> 3(메인화면) -> 4(설정화면) -> 5(변경화면) -> 6(팝업) -> 5(변경화면) -> 4(설정화면) -> 3(메인화면)
            // 순으로 push(present) / pop(dismiss) 해주고 싶었는데
            // 1(선택화면) -> 2(팝업) -> 3(메인화면) -> 4(설정화면) -> 1(변경화면) -> 2(팝업) -> 1(변경화면) -> ?????
            // 이런 식으로, Choice는 첫 화면이니까 여기서 더 뒤로 갈 화면이 없다고 인식하는건지.......??? 궁금합니다
            
            //            let sb = UIStoryboard(name: "Choice", bundle: nil)
            //            guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else {
            //                return
            //            }
            print("startButton else구문 실행됨")
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else { return }
//            let nav = UINavigationController(rootViewController: vc)

            
            self.dismiss(animated: true) {
                //nav.navigationController?.popToRootViewController(animated: true)
            }
            
//            nav.navigationController?.popToRootViewController(animated: true)
//            self.dismiss(animated: true)
            
            //UserDefaults.standard.set(true, forKey: "pop")
            view.makeToast("다마고치가 변경되었어용!")
            dismiss(animated: true)
        }
        
        UserDefaults.standard.set(tamaData?.kind, forKey: TamaEnum.UserDefualts.tamaName.rawValue)
        UserDefaults.standard.set(tamaData?.number, forKey: TamaEnum.UserDefualts.tamaNumber.rawValue)
    }
}

