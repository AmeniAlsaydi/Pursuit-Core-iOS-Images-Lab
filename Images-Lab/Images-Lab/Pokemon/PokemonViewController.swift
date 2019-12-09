//
//  PokemonViewController.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemonCards = [Card]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    
    func loadCards() {
        PokemonAPIClient.getCards { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
                
            case .success(let cards):
                self.pokemonCards = cards
            }
        }
    }

}

extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        
        return cell
    }
    
    
}
