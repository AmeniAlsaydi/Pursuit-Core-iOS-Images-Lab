//
//  ImageClient.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

struct ImageClient {
    
     static func fetchimage(for urlString: String,
                               completion: @escaping (Result<UIImage?, Error>) -> ()) {
            
            guard let url = URL(string: urlString) else {
               print("bad url \(urlString)")
                return
            }
        
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
               
                if let error = error {
                    print("error: \(error)")
                }
                
                if let data = data {
                    let image = UIImage(data: data)
                  
                    completion(.success(image))
                }
            }
            dataTask.resume()
    }
}
