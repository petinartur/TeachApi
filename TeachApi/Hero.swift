//
//  Hero.swift
//  TeachApi
//
//  Created by Артур Петин on 02.05.2021.
//

struct Hero: Decodable {
    let name: String
    let city: String
    
    init(heroData: [String:Any]) {
        name = heroData["name"] as? String ?? ""
        city = heroData["city"] as? String ?? ""
    }
    
    static func getHero(from value: Any) -> [Hero]{
        guard let heroesData = value as? [[String: Any]] else { return []}
        return heroesData.compactMap { Hero(heroData: $0)}
    }
}
