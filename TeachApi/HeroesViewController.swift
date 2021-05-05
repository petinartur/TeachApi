//
//  HeroesViewController.swift
//  TeachApi
//
//  Created by Артур Петин on 02.05.2021.
//

import UIKit
import Alamofire
class HeroesViewController: UITableViewController {
    
    var heroes: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroesCell
        let hero = heroes[indexPath.row]
        cell.configure(with: hero)
        return cell
    }

}

// MARK: - Networking
extension HeroesViewController {
 
    func fetchHeroes() {
        AF.request(URLExamples.myAPI.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.heroes = Hero.getHero(from: value)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
    }
}

}
