//
//  HeroesViewController.swift
//  TeachApi
//
//  Created by Артур Петин on 02.05.2021.
//

import UIKit

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
        guard let url = URL(string: URLExamples.myAPI.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
