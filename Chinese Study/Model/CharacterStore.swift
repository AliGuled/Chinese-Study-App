//
//  CharacterStore.swift
//  Chinese Study
//
//  Created by Guled Ali on 4/2/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation
class CharacterStore {
    
    var characters: [Character]
    
    //English Chinse character translation word by word
    
    init() {
        
        let snow = Character(chineseCharcter: "雪", pinyin: "Xuě", englishTranslation: "Snow")
        let wind = Character(chineseCharcter: "风", pinyin: "Fēng", englishTranslation: "Wind")
        let rain = Character(chineseCharcter: "雨", pinyin: "Yǔ", englishTranslation: "Rain")
        let warm = Character(chineseCharcter: "暖和", pinyin: "Nuǎnhuo", englishTranslation: "Warm")
        let sunny = Character(chineseCharcter: "晴朗", pinyin: "Qínglǎng", englishTranslation: "Sunny")
        let weather = Character(chineseCharcter: "雾", pinyin: "wù", englishTranslation: "Fog")
        
        characters = [snow, wind, rain, warm, sunny, weather]
        characters.shuffle()
        
    }
    
}
