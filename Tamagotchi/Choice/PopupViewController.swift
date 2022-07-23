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
        popupView.layer.backgroundColor = UIColor.backgroundColor.cgColor
        view.backgroundColor = UIColor(named: "ViewBackgroundColor")
        
        popupImageView.image = tamaData?.image
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else {
            return
        }
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        vc.tamaData = tamaData
        
        present(nav, animated: true)
    }
}
