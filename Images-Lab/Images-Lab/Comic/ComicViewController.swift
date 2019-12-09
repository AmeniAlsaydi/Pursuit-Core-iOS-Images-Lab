//
//  ViewController.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/8/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController {
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicTitle: UILabel!
    
    var comicNumber = 614
    var range = 1...200
    // var randomNumber = range.randomElement()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func loadComic(for comicNumber: Int){
        ComicAPIClient.getComic(for: comicNumber) { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let comic):
                print("title: \(comic.num)")
                
                DispatchQueue.main.async {
                    // any ui we need to be done should happen in this clousre

                    self.comicTitle.text = comic.title
                }
                
            }
        }
    }
    
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        // The "Random" button should go to a random comic.
        
        
        
        
    }
    
    
    @IBAction func recentButtonPressed(_ sender: UIButton) {
        // The "Most recent" button should go to the most recent comic.
        loadComic(for: comicNumber)
        
    }
    

}

