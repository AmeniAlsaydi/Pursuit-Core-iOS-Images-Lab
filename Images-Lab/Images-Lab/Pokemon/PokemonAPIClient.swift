//
//  PokemonAPIClient.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct PokemonAPIClient {
    
    static func getCards(completion: @escaping (Result<[Card], AppError>)-> ()) {
        let endpointURLString = "https://api.pokemontcg.io/v1/cards"
        
        NetworkHelper.shared.performDataTask(with: endpointURLString) {(result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let pokemon = try JSONDecoder().decode(PokemonCards.self, from: data)
                    let cards = pokemon.cards
                    completion(.success(cards))
                    
                } catch {
                    completion(.failure(.decodingError(error)))
                    
                }
            }
        }
        
    }
    
}
