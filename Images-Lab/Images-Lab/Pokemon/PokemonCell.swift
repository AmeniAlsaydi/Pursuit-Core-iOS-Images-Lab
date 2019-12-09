//
//  PokemonCell.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    
    var card: Card?
    
    func configureCell(for card: Card) {
        
        let cardImageUrl = card.imageUrl
        
        NetworkHelper.shared.performDataTask(with: cardImageUrl) { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let data):
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.cardImage.image = image
                }
                
            }
        }
        
    }
}

