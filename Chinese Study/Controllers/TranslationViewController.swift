//
//  TranslationViewController.swift
//  Chinese Study
//
//  Created by Guled Ali on 4/2/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit
import AVFoundation

class TranslationViewController: UIViewController {
    
    //chinese character label
    @IBOutlet weak var chineseCharacter: UILabel!
    
    //pinyin label
    @IBOutlet weak var pinyin: UILabel!
    //Engilsh translation label
    @IBOutlet weak var englishTranslation: UILabel!
    
    //computed charangter
    var charcter: Character? {
        didSet {
            navigationItem.title = charcter?.chineseCharcter
        }
    }

    //speech Sythesizer
    let sythesizer = AVSpeechSynthesizer()
    //Voice sythesizer
    let chineseVoice = AVSpeechSynthesisVoice(language: "zh-CN")
    let englisVoice = AVSpeechSynthesisVoice(language: "en-US")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let char = charcter else{return}
        chineseCharacter.text = charcter?.chineseCharcter
        pinyin.text = char.pinyin
        englishTranslation.text = char.englishTranslation
        
    }
    
    //Get the chinese audio
    func getChineseVoice() {
        guard let char = charcter else{return}
        let audio = AVSpeechUtterance(string: char.chineseCharcter)
        audio.voice = chineseVoice
        sythesizer.speak(audio)
    }
    //Get the engilsh audio
    func getEnglishVoice() {
        
        guard let englChar = charcter else {return}
        let audio = AVSpeechUtterance(string: englChar.englishTranslation)
        audio.voice = englisVoice
        sythesizer.speak(audio)
    }
    
    
    
    //Read aloud button for chinese voice
    @IBAction func readAloud(_ sender: UIButton) {
        
        getChineseVoice()
    }
    
    //Read aloud button for engilsh voice
    @IBAction func readEnglish(_ sender: UIButton) {
        
        getEnglishVoice()
    }
    

}
