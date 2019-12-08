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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        // The "Random" button should go to a random comic.
        
        
    }
    
    
    @IBAction func recentButtonPressed(_ sender: UIButton) {
        // The "Most recent" button should go to the most recent comic.
    }
    

}

