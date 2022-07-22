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
    @IBOutlet weak var popupImageView: UIView!
    @IBOutlet weak var popupTamagotchiNameLabel: UIView!
    @IBOutlet weak var popupDetailLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButton.designButton(lebelText: "취소")
        startButton.designButton(lebelText: "시작하기")
        
        view.backgroundColor = UIColor(named: "ViewBackgroundColor")
        
        
    }
    
    
}
