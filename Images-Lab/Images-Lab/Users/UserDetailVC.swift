//
//  UserDetailVC.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()


    }
    
    func updateUI() {
        
    }
    

}
