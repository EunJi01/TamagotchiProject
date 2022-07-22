//
//  ChoiceCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit

class ChoiceCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    
    static let identifier = "ChoiceCollectionViewCell"
    
    func configure(data: Tama) {

        tamagotchiImageView.image = data.image
        tamagotchiNameLabel.text = data.kind
        tamagotchiNameLabel.designLable()

    }
    
}
