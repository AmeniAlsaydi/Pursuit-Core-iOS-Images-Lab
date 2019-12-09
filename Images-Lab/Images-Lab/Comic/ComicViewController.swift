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
    
    var comicNumber = 2238
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComic(for: comicNumber)
    }
    
    func loadComic(for comicNumber: Int){
        
        var imageURL = "" 
        
        ComicAPIClient.getComic(for: comicNumber) { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let comic):
                imageURL = comic.img
                print("title: \(comic.num)")
                
                DispatchQueue.main.async {
                    
                    self.comicTitle.text = comic.title
                    NetworkHelper.shared.performDataTask(with: imageURL) { (result) in
                        switch result {
                        case .failure(let appError):
                            print("appError: \(appError)")
                        case .success(let data):
                            let image = UIImage(data: data)
                            
                            DispatchQueue.main.async {
                                self.comicImage.image = image
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        // The "Random" button should go to a random comic.
        let randomNumber = Int.random(in: 1...2238)
        
        loadComic(for: randomNumber)
  
    }
    
    
    @IBAction func recentButtonPressed(_ sender: UIButton) {
        // The "Most recent" button should go to the most recent comic.
        loadComic(for: comicNumber)
        
    }
    
    
}

