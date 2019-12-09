//
//  PokemonViewController.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var weaknessLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    
    var card: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let theCard = card else {
            fatalError("Issue with prepare for segue")
        }
        nameLabel.text = theCard.name
        setsLabel.text = "Sets: \(theCard.set)"
        typesLabel.text = "Types: \(theCard.types?.first ?? " ")"
        weaknessLabel.text = """
        Weaknesses:
            Type: \(theCard.weaknesses?.first?.type ?? "No type")
            Value: \(theCard.weaknesses?.first?.value ?? "No Value")
        """
        
        let cardImageUrl = theCard.imageUrlHiRes
        
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
