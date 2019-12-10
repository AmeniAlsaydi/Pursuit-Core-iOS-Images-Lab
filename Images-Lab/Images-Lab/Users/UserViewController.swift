//
//  UserViewController.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? UserDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("couldnt get detailVC or indexPath")
        }
        
        detailVC.user = users[indexPath.row]
    }
    
    func loadData() {
        UserAPIClient.getUsers { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
                
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            }
        }
    }
    
    
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else { fatalError("cell issue") }
        
        let user = users[indexPath.row]
        
        cell.configureCell(for: user)
        
        return cell
    }
    
    
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
