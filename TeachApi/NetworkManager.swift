//
//  NetworkManager.swift
//  TeachApi
//
//  Created by Артур Петин on 05.05.2021.
//

import Foundation
import Alamofire
class NetworkManager {
    
    static let share = NetworkManager()
    
    private init() {}
    
    func fetchHeroes(from url: String?, with complition: @escaping ([Hero]) -> Void) {
        AF.request(URLExamples.myAPI.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let heroess = Hero.getHero(from: value)
                    
                    DispatchQueue.main.async {
                        complition(heroess)
                    }
                case .failure(let error):
                    print(error)
                }
    }
    
}
}
