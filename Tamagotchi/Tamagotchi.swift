//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit
//func calculate(rice: Int, water: Int) -> Int {
//    var exp = (rice / 5) + (water / 2)
//
//    switch exp {
//    case 0...9:
//    }
//
//
//}
//
//// 성체까지 exp 퍼센트 남았어요!

struct Tama {

    var kind: String
    var detail: String
    var image: UIImage
    
}

struct Tamagotchi {
    
    let tamagotchi: [Tama] = [
        Tama(kind: "따끔따끔 다마고치", detail: "저는 따끔따끔 다마고치예용! 키는 120km 몸무게는 150톤이입니당>< 절 만지면 조금 따끔하지만, 마음만은 부드러워용!", image: UIImage(named: "1-6")!),
        Tama(kind: "방실방실 다마고치", detail: "저는 방실방실 다마고치예요~ 키는 30cm 몸무게는 3kg예요~ 겨울에 저랑 있으면 따뜻할거예요~", image: UIImage(named: "2-6")!),
        Tama(kind: "반짝반짝 다마고치", detail: "저는 반짝반짝 다마고치예요! 키는 200cm 뭄무게는 20g이예요! 밤에 저랑 있으면 화장실이 무섭지 않을거예요!", image: UIImage(named: "3-6")!)
    ]
    
    let prepare: Tama = Tama(kind: "준비중이에요", detail: "", image: UIImage(named: "noImage")!)
}

