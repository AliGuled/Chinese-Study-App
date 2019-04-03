//
//  CharactersCollectionViewController.swift
//  Chinese Study
//
//  Created by Guled Ali on 4/2/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation
import UIKit

class CharactersCollectionViewController: UICollectionViewController {
    
   var charcters = CharacterStore().characters
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chines Translation"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Cell for item at
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.characterLabel.text = charcters[indexPath.row].chineseCharcter
        
        return cell
        
    }
    
    //number items in a section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charcters.count
    }
    
    //Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "translation" {
            let destination = segue.destination as! TranslationViewController
            let itemRow = collectionView.indexPathsForSelectedItems?.first!.row
            destination.charcter = charcters[itemRow!]
        }
    }
    
}