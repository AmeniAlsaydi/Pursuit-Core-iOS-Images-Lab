//
//  UserAPIClient.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct UserAPIClient {
    
    static func getUsers(completion: @escaping (Result<[User], AppError>)-> ()) {
        let endpointURLString = "https://randomuser.me/api/?results=50"
        
        NetworkHelper.shared.performDataTask(with: endpointURLString) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let randomUsers = try JSONDecoder().decode(RandomUserData.self, from: data)
                    let users = randomUsers.results
                    completion(.success(users))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
