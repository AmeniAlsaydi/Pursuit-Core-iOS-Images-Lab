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
    @IBOutlet weak var stepperControl: UIStepper!
    
    var comicNumber = 2238 {
        didSet {
            loadComic(for: comicNumber)
            stepperControl.value = Double(comicNumber)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComic(for: comicNumber)
        configureStepper()
    }
    
    func configureStepper() {
        stepperControl.minimumValue = 1.0
        stepperControl.maximumValue = 2238.0
        stepperControl.stepValue = 1.0
        stepperControl.value = Double(comicNumber)
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
        comicNumber = Int.random(in: 1...2238)
        // loadComic(for: randomNumber)
    }
    
    @IBAction func recentButtonPressed(_ sender: UIButton) {
        // The "Most recent" button should go to the most recent comic.
        comicNumber = 2238
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        // Changing the stepper value up or down should display the comic from the next or previous day.
        comicNumber = Int(sender.value)
        
    }
    
    
    
}

