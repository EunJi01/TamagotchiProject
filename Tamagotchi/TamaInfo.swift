//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 황은지 on 2022/07/22.
//

import UIKit

struct Tama {

    var number: Int
    var kind: String
    var detail: String
    var image: UIImage
    
}

struct TamaInfo {
    
    let tamagotchi: [Tama] = [
        Tama(number: 1, kind: "따끔따끔 다마고치", detail: "저는 따끔따끔 다마고치예용! 키는 120km 몸무게는 150톤이입니당>< 절 만지면 조금 따끔하지만, 마음만은 부드러워용! 저를 키우실건가용?", image: UIImage(named: "1-6")!),
        Tama(number: 2, kind: "방실방실 다마고치", detail: "저는 방실방실 다마고치예요~ 키는 30cm 몸무게는 3kg예요~ 겨울에 저랑 있으면 따뜻할거예요~ 저랑 함께하실거예요~?", image: UIImage(named: "2-6")!),
        Tama(number: 3, kind: "반짝반짝 다마고치", detail: "저는 반짝반짝 다마고치예요! 키는 200cm 뭄무게는 20g이예요! 밤에 저랑 있으면 화장실이 무섭지 않을거예요! 저를 키워주세요!", image: UIImage(named: "3-6")!)
    ]
    
    let prepare: Tama = Tama(number: 99, kind: "준비중이에요", detail: "", image: UIImage(named: "noImage")!)
    
    let tamaText = ["밥 말고 이삭토스트 주시면 안돼요?", "물 말고 콜라 주시면 안돼요?", "당신 마음 속 non-optional이 되고 싶어요", "오션월드 가고싶당...", "배달 시키려고 했는데 코딩하다보니 가게가 영업종료했네요", "물 말고 자바칩 프라푸치노 주시면 안돼요?", "밥 말고 까르보불닭 주시면 안돼요?"]
    
}

struct TamaExp {
    
    var rice = UserDefaults.standard.integer(forKey: "rice")
    var water = UserDefaults.standard.integer(forKey: "water")
    
    func calculate() -> Int {
        let exp = 10 + (rice / 5) + (water / 2)
        let level = exp / 10
        UserDefaults.standard.set(level, forKey: "level")
        return level > 9 ? 9 : level
    }
    
}
