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
        tableView.delegate = self
        loadCards()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? PokemonDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not located detailVC or indexpath")
        }
        
        detailVC.card = pokemonCards[indexPath.row]
    }
    
    func loadCards() {
        PokemonAPIClient.getCards { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
                
            case .success(let cards):
                DispatchQueue.main.async {
                    self.pokemonCards = cards
                }
                
            }
        }
    }

}

extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else {
            fatalError("issue with cell")
        }
        
        let pokemonCard = pokemonCards[indexPath.row]
        
        cell.configureCell(for: pokemonCard)
        return cell
    }
    
    
}

extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
    }
    
   
}

