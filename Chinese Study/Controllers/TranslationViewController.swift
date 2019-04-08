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
    
    @IBOutlet weak var chineseCharacter: UILabel!
    
    @IBOutlet weak var pinyin: UILabel!
    @IBOutlet weak var englishTranslation: UILabel!
    
    var charcter: Character? {
        didSet {
            navigationItem.title = charcter?.chineseCharcter
        }
    }

    //speech Sythesizer
    let sythesizer = AVSpeechSynthesizer()
    //Voice sythesizer
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let char = charcter else{return}
        chineseCharacter.text = charcter?.chineseCharcter
        pinyin.text = char.pinyin
        englishTranslation.text = char.englishTranslation
        getVoice()
    }
    
    //Get the audio
    func getVoice() {
        guard let char = charcter else{return}
        let audio = AVSpeechUtterance(string: char.chineseCharcter)
        audio.voice = voice
        sythesizer.speak(audio)
    }
    
    //Read aloud button
    @IBAction func readAloud(_ sender: UIButton) {
        
        getVoice()
    }
    
    

}
