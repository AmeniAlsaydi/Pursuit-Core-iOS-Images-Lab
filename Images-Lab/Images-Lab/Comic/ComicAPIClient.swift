//
//  ComicAPIClient.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/8/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct ComicAPIClient {
    static func getComic(for num: Int, completion: @escaping (Result<Comic, AppError>)-> ()) {
    let endpointURLString = "http://xkcd.com/\(num)/info.0.json"
        
        NetworkHelper.shared.performDataTask(with: endpointURLString) { (result) in
                        switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let comic = try JSONDecoder().decode(Comic.self, from: data)
                    completion(.success(comic))
                    
                } catch {
                    completion(.failure(.decodingError(error)))
                    
                }
            }

        }
    }
}
