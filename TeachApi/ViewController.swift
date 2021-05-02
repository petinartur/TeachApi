//
//  ViewController.swift
//  TeachApi
//
//  Created by Артур Петин on 02.05.2021.
//

import UIKit

enum URLExamples: String {
    case imageURL = "https://media.contentapi.ea.com/content/dam/gin/images/2017/01/harry-potter-sorcerors-stone-key-art.jpg.adapt.crop1x1.767p.jpg"
    case myAPI = "https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8"

}

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case myApi = "My API"
}




class ViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .myApi: performSegue(withIdentifier: "showAPI", sender: nil)
        }
    }
    // MARK: - Navigation

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showAPI" {
        guard let heroesVS = segue.destination as? HeroesViewController else { return}
        heroesVS.fetchHeroes()
    }
}
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}



