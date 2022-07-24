//
//  ChoiceCollectionViewController.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit

class ChoiceCollectionViewController: UICollectionViewController {

    static let identifier = "ChoiceCollectionViewController"
    let tamaList = TamaInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        
        navigationItem.titleView?.tintColor = .fontColor
        collectionView.backgroundColor = .backgroundColor
        UserDefaults.standard.set(false, forKey: "Main")
        
        navigationItem.title = UserDefaults.standard.bool(forKey: "change") == false ? "다마고치 선택하기" : "다마고치 변경하기"
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//        print(#function)
//
//        if UserDefaults.standard.bool(forKey: "pop") == true {
//            print("팝 실행됨")
//            print(UserDefaults.standard.bool(forKey: "Main"))
//            self.navigationController?.popToRootViewController(animated: true)
//        }
//
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if UserDefaults.standard.integer(forKey: "tamaNumber") == tamaList.tamagotchi[indexPath.row].number {
            view.makeToast("이미 키우고 있는 다마고치예용!")
        } else {
            let sb = UIStoryboard(name: "Choice", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: PopupViewController.identifier) as? PopupViewController else {
                return
            }
            
            guard indexPath.row < tamaList.tamagotchi.count else {
                return
            }
            
            vc.tamaData = tamaList.tamagotchi[indexPath.row]
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoiceCollectionViewCell.identifier, for: indexPath) as? ChoiceCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row < tamaList.tamagotchi.count {
            let data = tamaList.tamagotchi[indexPath.row]
            cell.configure(data: data)
        } else {
            cell.configure(data: tamaList.prepare)
        }

        return cell
    }
    
    func layout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 12
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        // 13프맥에서만 셀 레이아웃이 제대로 되지 않는 문제 있음
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        
        collectionView.collectionViewLayout = layout
    }
}

