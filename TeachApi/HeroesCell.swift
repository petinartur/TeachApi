//
//  HeroesCell.swift
//  TeachApi
//
//  Created by Артур Петин on 02.05.2021.
//

import UIKit

class HeroesCell: UITableViewCell {

    @IBOutlet var heroNameLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    
    func configure(with hero: Hero) {
        heroNameLabel.text = hero.name
        cityNameLabel.text = hero.city
    }
}

