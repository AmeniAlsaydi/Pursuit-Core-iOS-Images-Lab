//
//  UserCell.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
 
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    var user: User?
    
    override func layoutSubviews() {
    super.layoutSubviews()
    userImage.layer.cornerRadius = userImage.frame.size.width/2
    }
    
    func configureCell(for user: User) {
        
        nameLabel.text = user.name.first
        ageLabel.text = user.dob.age.description
        phoneLabel.text = user.phone
        
        let thumbnailImage = user.picture.thumbnail
    
        NetworkHelper.shared.performDataTask(with: thumbnailImage) { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.userImage.image = image // is not displaying image
                }
                    
            }
        }
    }
}
